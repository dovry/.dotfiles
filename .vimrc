" version 2.3.7
" X.0.0 major 	- the file is overhauled
" 0.X.0 minor	- commands are added or removed
" 0.0.X fix 	- the file is improved in any other way

" general config / utility
set nocompatible 	" be iMproved, required
set number   		" line numbers
set ignorecase 		" http://vim.wikia.com/wiki/Searching
set smartcase		" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

" install plugin manager if it's not installed already
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'                 " tab completion
Plug 'scrooloose/nerdtree'               " file explorer in vim 
Plug 'kien/ctrlp.vim'                    " C-p to open up files from within Vim
Plug 'itchyny/lightline.vim'             " status at the bottom of the vim window
Plug 'tomtom/tcomment_vim'               " smart commenting
Plug 'easymotion/vim-easymotion'         " jump around with <leader><leader> for[W]ard, [B]ackward or [S]earch
Plug 'nathanaelkane/vim-indent-guides'   " display indent levels
Plug 'tpope/vim-surround'                " edit/close surrounding symbols such as brackets or quotes

" # Python plugins
"Plug 'davidhalter/jedi-vim'             " python autocompletion - uses jedi

" # Git plugins
Plug 'airblade/vim-gitgutter'            " shows diff in sidebar
"Plug 'sjl/gundo.vim'                    " visualise git undo tree

" Themes
Plug 'cocopon/iceberg.vim'               " dark blue & grey theme
Plug 'TroyFletcher/vim-colors-synthwave' " A E S T H E T I C - use Kolor from 'vim-airline' plugin to match themes
Plug 'vim-airline/vim-airline-themes'    " multiple themes for Lightline plugin

" to install the newest (versions) plugins, run
" :w
" :so ~/.vimrc
" :PluginInstall

call plug#end()


" statusbar - lightline plugin
set laststatus=2
set noshowmode

" colorscheme
colorscheme iceberg

" 'kolor' matches synthwave theme
let g:lightline = {
\ 'colorscheme': 'iceberg',
\ }


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

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
