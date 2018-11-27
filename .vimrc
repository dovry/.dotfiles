" version 1.2.1 
" X.0.0 means major version, where the whole file is changed
" 0.X.0 means a minor version, where a command is added/removed
" 0.0.X means a fix, where a command is moved, or the file is improved in any way

" general config / utility
syntax enable
set nocompatible 	" be iMproved, required
filetype off 		" required
set ignorecase 		" https://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
set smartcase

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins start
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'Valloric/YouCompleteMe'

" plugins end
" to install the newest (versions) plugins, run
" :w
" :so ~/.vimrc
" :PluginInstall

call vundle#end()            " required
filetype plugin indent on    " required


" statusbar - lightline plugin
set laststatus=2
set noshowmode

let g:lightline = {
\ 'colorscheme': 'iceberg',
\ }

" colorscheme
colorscheme iceberg

" ### keybindings
map <C-n> :NERDTreeToggle<CR>
"Allow saving of files as sudo when vim is in read-only mode
cmap w!! w !sudo tee > /dev/null %
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" code folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <C-space> za


" ### plugin configurations
" vim-table-mode
let g:table_mode_corner="|"
"vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
