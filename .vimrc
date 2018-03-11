".vimrc: configuration of vim
"Author: Liang Jiang
"Date: 2014-10-10

let mapleader = "\<Space>"

" set scrolloff=7
"显示行号
set number
"检测文件类型
filetype on
filetype indent on
" filetype plugin on
"记录历史的行数
set history=1000
"背景颜色为黑色
set background=dark
" colorscheme molokai
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1, "\#!/usr/bin/env bash") 
        call append(line("."), "\###############################################")
        call append(line(".")+1, "\# File Name: ".expand("%")) 
        call append(line(".")+2, "\# Author: Liang Jiang") 
        call append(line(".")+3, "\# mail: jiangliang0811@gmail.com") 
        call append(line(".")+4, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+5, "\# Description: ")
        call append(line(".")+6, "\###############################################")
        call append(line(".")+7, "") 
        call append(line(".")+8, "set -e")
        call append(line(".")+9, "set -x")
        call append(line(".")+10, "")
        normal G
     
    elseif &filetype == "python" 
        call setline(1, "\#!/usr/bin/env python") 
        call append(line("."), "\#coding=utf-8") 
        call append(line(".")+1, "\###############################################")
        call append(line(".")+2, "\# File Name: ".expand("%")) 
        call append(line(".")+3, "\# Author: Liang Jiang") 
        call append(line(".")+4, "\# mail: jiangliang0811@gmail.com") 
        call append(line(".")+5, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+6, "\# Description: ")
        call append(line(".")+7, "\###############################################")
        call append(line(".")+8, "") 
        call append(line(".")+9, "import argparse") 
        call append(line(".")+10, "import logging") 
        call append(line(".")+11, "handler = logging.StreamHandler()")
        call append(line(".")+12, "fmt = '[%(levelname)s] \\")
        call append(line(".")+13, "%(asctime)s - %(filename)s - line %(lineno)s - %(message)s'")
        call append(line(".")+14, "datefmt = '%Y-%m-%d %H:%M:%S'")
        call append(line(".")+15, "formatter = logging.Formatter(fmt, datefmt)")
        call append(line(".")+16, "handler.setFormatter(formatter)")
        call append(line(".")+17, "logger = logging.getLogger()")
        call append(line(".")+18, "logger.addHandler(handler)")
        call append(line(".")+19, "logger.setLevel(logging.DEBUG)")
        call append(line(".")+20, "")
        call append(line(".")+21, "")
        call append(line(".")+22, "def argparser():")
        call append(line(".")+23, "    parser = argparse.ArgumentParser()")
        call append(line(".")+24, "    return parser")
        call append(line(".")+25, "")
        call append(line(".")+26, "def main():")
        call append(line(".")+27, "    parser = argparser()")
        call append(line(".")+28, "    args = parser.parse_args()")
        call append(line(".")+29, "")
        call append(line(".")+30, "")
        call append(line(".")+31, "")
        call append(line(".")+32, "if \"__main__\" == __name__:")
        call append(line(".")+33, "    main()")
        normal 31G
        

    elseif &filetype == 'cpp' || &filetype == 'c'
        call setline(1, "/*")
        call append(line("."), "* File Name: ".expand("%")) 
        call append(line(".")+1, "* Author: Liang Jiang") 
        call append(line(".")+2, "* Mail: jiangliang0811@gmail.com") 
        call append(line(".")+3, "* Created Time: ".strftime("%c")) 
        call append(line(".")+4, "* Description: ")
        call append(line(".")+5,"*/")
        call append(line(".")+6, "")

        if &filetype == 'cpp'
            call append(line(".")+7, "#include <iostream>")
            call append(line(".")+8, "")
            call append(line(".")+9, "using namespace std;")
            call append(line(".")+10, "")
            call append(line(".")+11, "int main(int argc, char* argv[]) {") 
            call append(line(".")+12, "  ") 
            call append(line(".")+13, "  return 0;") 
            call append(line(".")+14,"}")
            normal 12G 
        endif
        if &filetype == 'c'
            call append(line(".")+7, "#include <stdio.h>")
            call append(line(".")+8, "")
            call append(line(".")+9, "int main(int argc, char* argv[]) {") 
            call append(line(".")+10, "  ") 
            call append(line(".")+11, "  return 0;") 
            call append(line(".")+12,"}")
            normal 10G 
        endif
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set clipboard=unnamed	" yank to the system register (*) by default
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" nmap <Leader><Leader>l :set list!<CR>
"禁止光标闪烁"
set gcr=a:block-blinkon0
"语法高亮
syntax on
"高亮当前行号"
" set cursorline
" set cursorcolumn
"缩进与智能缩进
set autoindent
set cindent
set smartindent
"tab键为4个空格，行之间交错时使用4个空格
"set expandtab 
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

"代码折叠
set foldmethod=indent
set nofoldenable
set foldlevel=100

nmap n nzz
nmap N Nzz
" nmap G Gzz
"设置快捷键
nmap <leader>o <C-o>
nmap <leader>i <C-i>
nmap <leader>f <C-f>
nmap <leader>b <C-b>
vmap <leader>f <C-f>
vmap <leader>b <C-b>
nmap  <Down> <C-w>j
nmap  <Left> <C-w>h
nmap  <Up> <C-w>k
nmap  <Right> <C-w>l
nmap <leader>= <C-w>+
nmap <leader>- <C-w>-
nmap <leader>0 <C-w>=
nmap <leader>] <C-w>>
nmap <leader>[ <C-w><
map  fj <Esc>
omap fj <Esc>
imap fj <Esc>
cmap fj <Esc> 
nmap fj <Esc>
map <leader>n :NERDTreeToggle<cr>
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
nmap <leader><leader>/ :set list!<cr>

nnoremap <silent><leader>jp :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <silent><leader>jn :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

"property of cscope
set csprg=/usr/local/bin/cscope
"property of supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabRetainCompletionType = 2

" set *(#) in visual mode to forward/backward search selected content
vnoremap * y/<C-r>0<CR>
vnoremap # y?<C-r>0<CR>

"properties of matlab"
source $VIMRUNTIME/macros/matchit.vim
nmap <Leader>w :wa<cr>
nmap <Leader>W :w !sudo tee > /dev/null %<cr>
nmap <Leader>q :q<cr>
nmap <Leader>Q :qa<cr>
" nmap <Leader><leader>q :qa<cr>
nmap <Leader>x :x<cr>
nmap <Leader>X :xa<cr>
"set <leader>p to toggle paste mode
nmap <leader>] :set paste!<BAR>set paste?<CR>

set splitbelow 
set splitright
nmap <Leader>v :vnew<CR>
nmap <Leader>s :new<CR>

"auto-completion"
set completeopt=longest,menu
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Plugins
Plugin 'airblade/vim-gitgutter'
function! GitGutterPreviewToggle()
  if !exists('g:gitgutter_preview_window')
    exec 'GitGutterPreviewHunk'
    let g:gitgutter_preview_window = bufnr('$')
  else
    exec "bd ".g:gitgutter_preview_window
    unlet g:gitgutter_preview_window
  endif
endfunc
function! GitGutterNextHunkWithPreview()
  exec "GitGutterNextHunk"
endfunc
function! GitGutterPrevHunkWithPreview()
  exec "GitGutterPrevHunk"
endfunc
nnoremap <leader><leader>n :call GitGutterNextHunkWithPreview()<CR>
nnoremap <leader><leader>p :call GitGutterPrevHunkWithPreview()<CR>
nnoremap <Leader>hg :GitGutterLineHighlightsToggle<CR>
nnoremap <Leader>hs :GitGutterStageHunk<CR>
nnoremap <Leader>hu :GitGutterUndoHunk<CR>
nnoremap <Leader>hp :call GitGutterPreviewToggle()<CR>
let g:gitgutter_max_signs = 10000
" Plugin 'DfrankUtil'
Plugin 'gmarik/vundle'
" Plugin 'gregsexton/gitv'
Plugin 'kshenoy/vim-signature'

Plugin 'Lokaltog/vim-easymotion'
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set backspace=2
set t_Co=256
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
Plugin 'majutsushi/tagbar'
"tagbar"
let tagbar_left=0 
nnoremap <Leader>t :TagbarToggle<CR> 
let g:tagbar_autofocus=1
let g:tagbar_map_showproto=','
let g:tagbar_autoclose=1
let tagbar_width=40 
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
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.pyc$', '\.png$']
Plugin 'vim-syntastic/syntastic'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/'] 
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
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

Plugin 'tpope/vim-commentary'
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType vim set commentstring=\"\ %s

" Plugin 'tpope/vim-fugitive'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'vim' : 1,
      \ 'json' : 1,
      \}
let g:ycm_error_symbol='>>'  
let g:ycm_warning_symbol='>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  
"开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files = 1  
"开启语义补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"在接受补全后不分裂出一个窗口显示接受的项  
set completeopt-=preview  
"不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0  
"注释和字符串的的补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"每次重新生成匹配项，禁止缓存匹配项  
"let g:ycm_cache_omnifunc=0  
"在注释中也可以补全  
let g:ycm_complete_in_comments=1  
"在字符串中也可以补全
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion='<C-d>'
"输入第一个字符就开始补全  
" let g:ycm_min_num_of_chars_for_completion=1  
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可  
let g:ycm_use_ultisnips_completer=0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" let g:ycm_min_num_of_chars_for_completion=5
"let g:ycm_auto_trigger = 0
"设置跳转的快捷键，可以跳转到definition和declaration  
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>  
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>  
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>  
" Plugin 'vimprj'
" Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'Yggdroot/indentLine'
" Plugin 'ZoomWin'
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_insert_maps = {'f' : 1}

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_use_caching = 0
map <leader>cf :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode='rwa'
let g:ctrlp_by_filename=1
let g:ctrlp_regexp=1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20'

Plugin 'skywind3000/asyncrun.vim'  

Plugin 'dbsr/vimpy'
nmap <leader><leader>v :VimpyCheckLine<cr>

Plugin 'Jallet/quickrun.vim'

Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_error = ''
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
function! DeleteCurrentBuffer()
  " close current buffer and jump to previous buffer
  let id = bufnr('%')
  :execute "bp"
  :execute ":bd ".l:id
endfunction
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>1 :b 1<CR>
nnoremap <Leader>2 :b 2<CR>
nnoremap <Leader>3 :b 3<CR>
nnoremap <Leader>4 :b 4<CR>
nnoremap <Leader>5 :b 5<CR>
nnoremap <Leader>6 :b 6<CR>
nnoremap <Leader>7 :b 7<CR>
nnoremap <Leader>8 :b 8<CR>
nnoremap <Leader>9 :b 9<CR>
nnoremap ,, <C-^>
Plugin 'henrik/vim-indexed-search'
" Plugin 'vim-scripts/highlight.vim'
Plugin 'Jallet/ZoomSplit'
nnoremap <leader>z :ToggleZoom<CR>
Plugin 'vim-scripts/Marks-Browser'
nmap <leader>m :MarksBrowser<cr>
Plugin 'dyng/ctrlsf.vim'
vnoremap <leader>cs y:CtrlSF "<C-r>0"<CR>
nmap <leader>cs <Plug>CtrlSFCCwordExec
let g:ctrlsf_ackprg='ag'

Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger=",<Tab>"
let g:UltiSnipsJumpForwardTrigger=",f"
let g:UltiSnipsJumpBackwardTrigger=",b"
let g:UltiSnipsListSnippets=",,"

Plugin 'honza/vim-snippets'
func! OpenSnippets()
  let default_snippets_dir=$HOME."/.vim/bundle/vim-snippets/snippets/"
  let custom_snippets_dir=$HOME."/.vim/UltiSnips/"
  let snippet_file=&filetype.".snippets"
  let default_snippets_file=l:default_snippets_dir."".l:snippet_file
  let custom_snippets_file=l:custom_snippets_dir."".l:snippet_file
  echo l:default_snippets_file
  if filereadable(l:default_snippets_file) == 1
    :execute "vs | view".l:default_snippets_file
  endif
  :execute "vs ".l:custom_snippets_file
endfunc
nmap <leader><leader>u :call OpenSnippets()<CR>

Plugin 'AndrewRadev/linediff.vim'
vmap <leader>ld :Linediff<CR>
nmap <leader>R :LinediffReset<CR>
