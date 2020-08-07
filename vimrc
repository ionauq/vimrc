" Mac vimrc
"
set nocompatible              " be iMproved, required Must be first line
set fileencodings=utf-8       " encoding dectection
filetype plugin indent on     " required; Automatically detect file types
set encoding=utf-8
set backspace=indent,eol,start

" Vundle {
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
    Plugin 'VundleVim/Vundle.vim'
"   Plugin 'tomasr/molokai'
    Plugin 'dracula/vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'bling/vim-bufferline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'kien/ctrlp.vim'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'majutsushi/tagbar'
    Plugin 'rust-lang/rust.vim'
    Plugin 'raimondi/delimitmate'
call vundle#end()

" command:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" }


" dracula {
    colorscheme dracula
    syntax enable
    set termguicolors
" }

" molokai {
"   colorscheme molokai
"   let g:molokai_original = 1
" }


set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>            " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" }

set showcmd                        " show command in bottom bar
set showmode                       " Display the current mode
set cursorline                     " Highlight current line
highlight clear LineNr             " Current line number row will have same background color in relative mode
highlight clear CursorLine         " remove current line color

" Key (re)Mappings {
    let mapleader = ','
"


" 快捷键
" 移除查询关键字高亮
nmap <silent> <leader>/ :nohlsearch<CR>


" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        "autocmd VimEnter * NERDTree                         "open a NERDTree automatically when vim starts up
        "open a NERDTree automatically when vim starts up if no files were specified
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        "open NERDTree automatically when vim starts up on opening a directory
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
        " 快捷键
        " t 在新 Tab 中打开选中文件/书签
        " T 在新 Tab 中打开选中文件/书签
        " o 打开关闭文件或者目录
        " O 打开结点下的所有目录
        " x 合拢当前结点的父目录
        " X 合拢当前结点的所有目录
        " p 到上层目录
        " P 到根目录
        " K 到同目录第一个节点
        " J 到同目录最后一个节点
        " m 显示文件系统菜单
        " gt 跳转到后一个Tab 页
        " gT 跳转到前一个Tab 页
        " r 递归刷新选中目录
        " R 递归刷新根结点
        " ,e 切换展示侧边栏
        map <leader>e :NERDTreeToggle<CR>
        " ,E 切换侧边栏
        map <leader>ww <C-W>w
        " ,wh 左侧树形目录
        map <leader>wh <C-W>h
        " ,wl 右侧窗口
        map <leader>wl <C-W>l

        let NERDTreeShowBookmarks=1                        "show NERDTree bookmarks
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=2                            "change current folder as root
        let NERDTreeQuitOnOpen=0                           "close NERDtree when files was opened
        let NERDTreeShowHidden=0                           "是否显示隐藏文件
        let NERDTreeKeepTreeInNewTab=1
    endif
 " }

 " CtrlP {
    if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
        set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
        let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
    endif
 " }

 " airline-theme{
     if isdirectory(expand("~/.vim/bundle/vim-airline-themes"))
         let g:airline_theme='tomorrow'
     endif
 " }

 " airline{
    if isdirectory(expand("~/.vim/bundle/vim-airline"))
        let g:airline_powerline_fonts = 1
    endif
 " }
 
" tagbar{
"  需要先安装ctags
"  Mac: brew install ctags
"
    if isdirectory(expand("~/.vim/bundle/tagbar"))
        " 快捷键
        " ,tt 打开 tarbar
        nmap <leader>tt :TagbarToggle<CR>

        let g:tagbar_width=25
    endif
" }

 " rust{
    if isdirectory(expand("~/.vim/bundle/rust.vim"))
          let g:rustfmt_autosave = 1
    endif
 " }
 "
 "
 " 快捷键及命令
 "
 " Rust
 " :Crun   
