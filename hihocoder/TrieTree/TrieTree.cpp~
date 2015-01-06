#include <iostream>
#include <string>

namespace hihocoder {
namespace trietree {
class TrieTree {
	struct Node {
		Node* child[26];
		int count;
	};
public:
	bool init() {
		NUM_LETTER = 26;
		root = new Node;
		root->count = 0;
		for (int i = 0; i < NUM_LETTER; ++i) {
			root->child[i] = NULL;	
		}

		return true;
	}

	bool insert(const std::string& word) {
		Node *p = root;
		++p->count;	
		int length = word.length();
		for (int i = 0; i <length; ++i) {
			//for (int j = 0; j < NUM_LETTER; ++j) {
			//	p->child[j] = NULL;	
			//}
			
			int index = word.at(i) - 'a';
			if (p->child[index] == NULL) {
				p->child[index] = new Node;
				
				Node *q = p->child[index];	
				for (int i = 0; i < NUM_LETTER; ++i) {
					q->child[i] = NULL;	
				}
				
				p->child[index]->count = 0;

			}
			p = p->child[index];
			++p->count;	
		}

		return true;
	}
	bool search(const std::string& word, int* count) {
		if (count == NULL) {
			return false;	
		}	
		Node *p = root;
		int length = word.length();
		for (int i = 0; i < length; ++i) {
			int index = word.at(i) - 'a';
			p = p->child[index];
			if (p == NULL) {
				*count = 0;
				return true;
			}
			
		}


		*count = p->count;
		return true;
	}
private:
	Node* root;
	int NUM_LETTER;
};
}// end namespace	
}// end namespace

int main() {
	hihocoder::trietree::TrieTree trietree; 
	if (!trietree.init()) {
		std::cout << "init trietree failed.";
		return 0;
	}
	
	int num_words = 0;
	std::cin >> num_words;
	std::string word;
	while (num_words) {
		std::cin >> word;
		if (!trietree.insert(word)) {
			std::cout << "insert " << word << " failed!" << std::endl;
			return 0;
		}

		--num_words;
	}

	int num_query = 0;
	std::cin >> num_query;
	while (num_query) {
		std::cin >> word;
		int count = 0;	
		if (!trietree.search(word, &count)) {
			std::cout << "failed!" << std::endl;
			return 0;
		}

		std::cout << count << std::endl;
		--num_query;	
	}
}
