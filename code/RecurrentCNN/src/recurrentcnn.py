#!/usr/bin/env python

import time
import sys
from keras.layers import Input, Convolution2D, merge, Dense, Activation, Flatten, MaxPooling2D, AveragePooling2D
from keras.activations import relu
from keras.models import Model
from keras.datasets import cifar10
from keras.utils.visualize_util import plot
from keras.utils import np_utils
from keras.optimizers import SGD
from keras.preprocessing.image import ImageDataGenerator
from keras.callbacks import RemoteMonitor, Callback, LearningRateScheduler

import numpy as np

def recurrentcnn():
    data = Input(shape = (3, 32, 32), name = "data")
    conv1 = Convolution2D(nb_filter = 16, nb_row = 3, nb_col = 3, border_mode = "same")(data)
    relu1 = Activation("relu")(conv1)
    filter_1 = Convolution2D(nb_filter = 16, nb_row = 3, nb_col = 3, border_mode = "same")
    conv2 = filter_1(relu1)
    relu2 = Activation("relu")(conv2)
    conv3 = filter_1(relu2)
    relu3 = Activation("relu")(conv3)

    pool_3 = Convolution2D(nb_filter = 32, subsample = (2, 2), nb_row = 3, nb_col = 3, border_mode = "same")(relu3)
    relu_3 = Activation("relu")(pool_3)
    

    filter_2 = Convolution2D(nb_filter = 32, nb_row = 3, nb_col = 3, border_mode = "same")
    conv4 = filter_2(relu_3)
    relu4 = Activation("relu")(conv4)
    conv5 = filter_2(relu4)
    relu5 = Activation("relu")(conv5)

    pool_5 = Convolution2D(nb_filter = 64, subsample = (2, 2), nb_row = 3, nb_col = 3, border_mode = "same")(relu5)
    relu_5 = Activation("relu")(pool_5)

    filter_3 = Convolution2D(nb_filter = 64, nb_row = 3, nb_col = 3, border_mode = "same")
    conv6 = filter_3(relu_5)
    relu6 = Activation("relu")(conv6)
    conv7 = filter_3(relu6)
    relu7 = Activation("relu")(conv7)

    global_pool = AveragePooling2D(pool_size = (8, 8), strides = (8, 8), border_mode = "valid")(relu7)
    
    flatten = Flatten()(global_pool)
    dense = Dense(output_dim = 10)(flatten)
    
    model = Model(input = [data], output = dense)
    plot(model, to_file='./model.png', show_shapes=True)
    
    return model

def main():
    batch_size = 128
    nb_epoch = 200
    nb_classes = 10
    start = time.time()
    print("Loading data")
    (X_train, y_train), (X_test, y_test) = cifar10.load_data()
    print('X_train shape:', X_train.shape)
    print(X_train.shape[0], 'train samples')
    print(X_test.shape[0], 'test samples')
    X_train = X_train.astype('float32')
    X_test = X_test.astype('float32')
    X_train /= 255
    X_test /= 255
    Y_train = np_utils.to_categorical(y_train, nb_classes)
    Y_test = np_utils.to_categorical(y_test, nb_classes)
    duration = time.time() - start
    print "{} s to load data".format(duration)

    start = time.time()
    print("Making model")
    model = recurrentcnn()
    duration = time.time() - start
    print "{} s to Make model".format(duration)

    sgd = SGD(lr=0.01, decay=0, momentum=0.9, nesterov=False)
    def lr_schedule(epoch):
        if 0 <= epoch and epoch < 160:
            return 0.01
        elif 160 <= epoch and epoch <= 240:
            return 0.001
        else:
            return 0.0001
    start = time.time()
    print("Compiling model")
    model.compile(loss='categorical_crossentropy',
                  optimizer=sgd,
                  metrics=['accuracy'])
    duration = time.time() - start

    print "{} s to compile model".format(duration)
    datagen = ImageDataGenerator(featurewise_std_normalization = True,
            width_shift_range = 0.125, 
            height_shift_range = 0.125, 
            horizontal_flip = True)
    test_datagen = ImageDataGenerator(featurewise_std_normalization = True,
            width_shift_range = 0.125, 
            height_shift_range = 0.125, 
            horizontal_flip = True)
    datagen.fit(X_train)
    test_datagen.fit(X_test)
    history = model.fit_generator(datagen.flow(X_train, Y_train ,batch_size = batch_size),
            samples_per_epoch = X_train.shape[0], nb_epoch = nb_epoch,
            callbacks = [LearningRateScheduler(lr_schedule)],  
            validation_data=test_datagen.flow(X_test, Y_test, batch_size = 100),
            nb_val_samples = 10000)
    loss = np.asarray(history.history["loss"])
    acc = np.asarray(history.history["acc"])
    val_loss = np.asarray(history.history["val_loss"])
    val_acc = np.asarray(history.history["val_acc"])
    np.savetxt("loss", loss, fmt = "%f")
    np.savetxt("acc", acc, fmt = "%f")
    np.savetxt("val_acc", val_acc, fmt = "%f")
    np.savetxt("val_loss", val_loss, fmt = "%f")

if "__main__" == __name__:
    main()
