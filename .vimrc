" version 0.0.1 
" X.0.0 means major version, where the whole file is changed
" 0.X.0 means a minor version, where a command is added/removed
" 0.0.X means a fix, where a command is moved, or the file is improved in any way

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins start
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'vim-airline/vim-airline'

" plugins end
" to install the newest (versions) plugins, run:
" :so ~/.vimrc and then :PluginInstall


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

syntax on

" colorscheme
colorscheme synthwave

" forces the caret past the last character
virtualedit=onemore

" keybindings
map <C-n> :NERDTreeToggle<CR>
