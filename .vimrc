".vimrc: configuration of vim
"Author: Liang Jiang
"Date: 2014-10-10

"显示行号
set number
"检测文件类型
filetype on
filetype indent on
"记录历史的行数
set history=1000
"背景颜色为黑色
set background=dark
"语法高亮
syntax on
"缩进与智能缩进
set autoindent
set cindent
set smartindent
"tab键为4个空格，行之间交错时使用4个空格
set expandtab 
set tabstop=4
set shiftwidth=4
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
set gdefault
"备份设置
"修改文件后自动备份，加“~”后缀
""if has("vms")
""set nobackup
""else
""set backup
""endif

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
set backspace=indent,eol,start
set nocompatible
set t_Co=256
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

"代码折叠
set foldmethod=syntax
set foldlevel=100

"设置快捷键
map  df <Esc>
omap df <Esc>
imap df <Esc>
nmap df <Esc>
vmap df <Esc>
nmap J <C-w>j
nmap H <C-w>h
nmap K <C-w>k
nmap L <C-w>l
nmap W <C-w>w
nmap ff <C-f>
vmap ff <C-f>
nmap bb <C-b>
vmap bb <C-b>
nmap oo <C-o>
map <F5> :NERDTree<cr>
""imap <C-l> <Esc>la
imap ,, <Esc>la
""imap <C-h> <Esc>j
""map <C-s> :wa<cr>
map <C-c> :wqa<cr>
"括号自动补全
inoremap ( ()<Esc>i

inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i

""let leader = "-"
:nnoremap <leader>d <C-b>
"引号自动补全
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

"property of taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Sort_Type = "name"
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
"property of winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'

"property of cscope
set csprg=/usr/local/bin/cscope
"property of supertab
"let g:SuperTabDefaultCompletionType = "context"

