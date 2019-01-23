" version 1.3.7
" X.0.0 means major version, where there is an overhaul
" 0.X.0 means a minor version, where a command is added/removed
" 0.0.X means a fix, where a command is moved, or the file is improved in any way

" general config / utility
syntax enable
set nocompatible 	" be iMproved, required
set number    " line numbers
filetype off 		" required
set ignorecase 		" https://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
set smartcase

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins start
Plugin 'ervandew/supertab' " tab completion
Plugin 'scrooloose/nerdtree' " file explorer in vim 
Plugin 'itchyny/lightline.vim' " line at the bottom of the vim window
Plugin 'tomtom/tcomment_vim' " smart commenting
Plugin 'tmhedberg/SimpylFold' " better code folding 
Plugin 'easymotion/vim-easymotion' " jump around with <leader><leader> for[W]ard, [B]ackward or [S]earch
Plugin 'kien/ctrlp.vim' " C-p to open up files from within Vim
Plugin 'nathanaelkane/vim-indent-guides' " display indent levels
Plugin 'dhruvasagar/vim-table-mode' " table formatter, use | text| <newline> || to take affect
Plugin 'tpope/vim-surround' " edit/close surrounding symbols such as brackets or quotes
Plugin 'terryma/vim-multiple-cursors' " multiple cursors
Plugin 'chrisbra/Colorizer' " Color highlighting

" # Python plugins
Plugin 'davidhalter/jedi-vim' " python autocompletion - uses jedi

" # Git plugins
"Plugin 'airblade/vim-gitgutter'
"Plugin 'sjl/gundo.vim' " visualise git undo tree

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
