set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" vim color scheme
" Plugin 'morhetz/gruvbox' (another theme)
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
" NERDTree
Plugin 'scrooloose/nerdtree'
" 搜尋文件
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" -----------------------------------------------------
set encoding=utf-8
set laststatus=2
set t_Co=256
" Set Airline
" -----------------------------------------------------
let g:airline_powerline_fonts = 1 " enable powerline font
"let g:airline_theme='bubblegum'
"let g:airline_solarized_bg='dark'
" -----------------------------------------------------
colorscheme Tomorrow-Night
syntax enable
set nu " show lines
set mouse=a " enable mouse
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab

nmap <F5> :NERDTreeToggle<cr>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
