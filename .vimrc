".vimrc: configuration of vim
"Author: Liang Jiang
"Date: 2014-10-10

let mapleader = ","

""将 pathogen 自身也置于独立目录中，需指定其路径 
""runtime bundle/pathogen/autoload/pathogen.vim
""运行 pathogen
""execute pathogen#infect()
"显示行号
set number
"检测文件类型
filetype on
filetype indent on
filetype plugin on
"记录历史的行数
set history=1000
"背景颜色为黑色
set background=dark
""colorscheme phd
""colorscheme molokai
""colorscheme solarized

"禁止光标闪烁"
set gcr=a:block-blinkon0
"语法高亮
syntax on
"高亮当前行号"
""set cursorline
""set cursorcolumn
"缩进与智能缩进
set autoindent
set cindent
set smartindent
"tab键为4个空格，行之间交错时使用4个空格
set expandtab 
set tabstop=2
set shiftwidth=2
set softtabstop=2
"设置匹配模式，括号匹配等
set showmatch
"去除Vim的GUI版本的toolbar
set guioptions=T
"去掉警告响声

"查询相关设置
set vb t_vb= 
"查询时，匹配当前已输入单词的第一个单词
set incsearch
"高亮查询结果
set hlsearch
"替换时所有的行内匹配都被替换，不是只有第一个
""set gdefault
"备份设置
"修改文件后自动备份，加“~”后缀
""if has("vms")
""set nobackup
""else
""set backup
""endif
set nobackup

"禁止光标闪烁"
set novisualbell
"状态栏相关设置
"设置右下角显示光标位置的状态行
set ruler
"设置状态栏显示格式
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c]
"设置总是显示状态栏
set laststatus=2

"powerline
set guifont=PowerlineSymbols\ for\ Powerline
"backspace"
""set backspace=indent,eol,start
set nocompatible
set t_Co=256
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

"代码折叠
set foldmethod=indent
set nofoldenable
set foldlevel=100

"设置快捷键
""map  <Leader>d <Esc>
""omap <Leader>d <Esc>
""imap <Leader>d <Esc>
""cmap <Leader>d <Esc> 
nmap vo <C-o>
nmap vi <C-i>
nmap  J <C-w>j
nmap  H <C-w>h
nmap  K <C-w>k
nmap  L <C-w>l
map  df <Esc>
omap df <Esc>
imap df <Esc>
cmap df <Esc> 
imap mf <cr>
nmap <Leader>f <C-f>
vmap <Leader>f <C-f>
nmap <Leader>b <C-b>
vmap <Leader>B <C-b>
nmap <Leader>z :ZoomWin<cr>
nmap `o <C-o>
nmap <Leader>v <C-v>
nmap <Leader>r :source ~/.vimrc<cr>
nmap <Leader>v <C-v>
" imap fj <cr>
" nmap fj <cr>
" cmap fj <cr>
""nmap z xh
map <leader>n :NERDTree<cr>
map <leader>t :Tlist<cr>
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
""imap <C-l> <Esc>la
" imap ,, <Esc>la
""imap <C-h> <Esc>j
""map <C-c> :wqa<cr>
"映射空格加分号为右shift，不知道如何直接映射，所以采取暴力方法"
map  q Q
map  ;w W
map  ;e E
map  ;r R
map  ;t T
map  ;a A
map  ;s S
map  ;d D
map  ;f F
map  ;df ;<Esc>
map  ;g G
map  ;z Z
map  ;x X
map  ;c C
map  ;v V
map  ;b B
map  ;` ~
map  ;1 !
map  ;2 @
map  ;3 #
map  ;4 $
map  ;4 $
map  ;5 %
imap  ;q Q
imap  ;w W
imap  ;e E
imap  ;r R
imap  ;t T
imap  ;a A
imap  ;s S
imap  ;d D
""imap  ;f F
imap  ;df ;<Esc>
imap  ;g G
imap  ;z Z
imap  ;x X
imap  ;c C
imap  ;v V
imap  ;b B
imap  ;` ~
imap  ;1 !
imap  ;2 @
imap  ;3 #
imap  ;4 $
imap  ;4 $
imap  ;5 %
cmap  ;q Q
cmap  ;w W
cmap  ;e E
cmap  ;r R
cmap  ;t T
cmap  ;a A
cmap  ;s S
cmap  ;d D
cmap  ;f F
cmap  ;df ;<Esc>
cmap  ;g G
cmap  ;z Z
cmap  ;x X
cmap  ;c C
cmap  ;v V
cmap  ;b B
cmap  ;` ~
cmap  ;1 !
cmap  ;2 @
cmap  ;3 #
cmap  ;4 $
cmap  ;4 $
cmap  ;5 %
""nnoremap z xh
"括号自动补全
""inoremap ( ()<Esc>i

""inoremap [ []<Esc>i
""inoremap { {}<Esc>i
""inoremap < <><Esc>i

"":nnoremap <leader>d <C-b>
"引号自动补全
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Sort_Type = "name"
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
"property of winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'

"property of cscope
set csprg=/usr/local/bin/cscope
"property of supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabRetainCompletionType = 2

"properties of matlab"
source $VIMRUNTIME/macros/matchit.vim
""autocmd BufEnter *.m compiler mlint
"auto fold"
""autocmd FileType c,cpp  
"Leader shortcut"
nmap <Leader>w :wa<cr>
nmap <Leader>q :q<cr>
nmap <Leader>x :x<cr>
nmap <Leader>Q :q!<cr>
" nmap <Leader>a :qa<cr>
"indent-guide"
"" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=1
" 色块宽度
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>d <Plug>IndentGuidesToggle
" 设置插件 indexer 调用 ctags 的参数
" " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"""

"tagbar"
let tagbar_left=1 
nnoremap <Leader>tb :TagbarToggle<CR> 
let tagbar_width=32 
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }


nnoremap <silent><Leader>g :Grep<CR>
"auto-completion"
set completeopt=longest,menu
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "airblade/vim-gitgutter"
Bundle "DfrankUtil"
Bundle 'gmarik/vundle'
Bundle "gregsexton/gitv"
Bundle "kshenoy/vim-signature"
Bundle 'Lokaltog/vim-easymotion'
Bundle "Lokaltog/vim-powerline"
Bundle "majutsushi/tagbar"
Bundle "Raimondi/delimitMate"
Bundle "rdnetto/YCM-Generator"
Bundle "scrooloose/nerdtree"
Bundle "syntastic"
Bundle "taglist.vim"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-surround"
Bundle 'Valloric/YouCompleteMe'
Bundle "vimprj"
Bundle "vim-scripts/indexer.tar.gz"
Bundle "Yggdroot/indentLine"
Bundle "ZoomWin"
"for vim-commetary"
autocmd FileType python,shell set commentstring=#\ %s
"for gitgutter
let g:gitgutter_max_signs = 10000
"for syntastic and YouCompleteMe
let g:ycm_error_symbol='>>'  
let g:ycm_warning_symbol='>'
"let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/'] 
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_wq = 0
noremap <leader>e :call ToggleErrors()<cr> 
noremap <leader>en :lnext<cr>
noremap <leader>ep :lprevious<cr>
function! ToggleErrors()
  let old_last_winnr = winnr('$')
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel"
    Errors
  endif
endfunction
  

let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  
"开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files = 1  
"开启语义补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"在接受补全后不分裂出一个窗口显示接受的项  
set completeopt-=preview  
"不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0  
"每次重新生成匹配项，禁止缓存匹配项  
"let g:ycm_cache_omnifunc=0  
"在注释中也可以补全  
"let g:ycm_complete_in_comments=1  
let g:ycm_key_invoke_completion='<C-d>'
"输入第一个字符就开始补全  
" let g:ycm_min_num_of_chars_for_completion=1  
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可  
let g:ycm_use_ultisnips_completer=0
" let g:ycm_min_num_of_chars_for_completion=5
"let g:ycm_auto_trigger = 0
"设置跳转的快捷键，可以跳转到definition和declaration  
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>  
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>  
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>  

"GitGutter
nnoremap <leader><leader>n :GitGutterNextHunk<CR>
nnoremap <leader><leader>p :GitGutterPrevHunk<CR>
