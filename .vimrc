" 2.5.9 - vimrc
" X.0.0 major 	- the file is overhauled
" 0.X.0 minor	- commands are added or removed
" 0.0.X fix 	- the file is improved in any other way

" general config / utility
set nocompatible    " be iMproved, required
set relativenumber  " line numbers, but RELATIVE!
set ignorecase      " http://vim.wikia.com/wiki/Searching
set smartcase       " ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'                " tab completion
Plug 'scrooloose/nerdtree'              " file explorer in vim 
Plug 'kien/ctrlp.vim'                   " C-p to open up files from within Vim
Plug 'tomtom/tcomment_vim'              " smart commenting
Plug 'easymotion/vim-easymotion'        " jump around with <leader><leader> for[W]ard, [B]ackward or [S]earch
Plug 'nathanaelkane/vim-indent-guides'  " display indent levels
Plug 'tpope/vim-surround'               " edit/close surrounding symbols such as brackets or quotes
Plug 'pearofducks/ansible-vim'          " YAML/Ansible syntax 
Plug 'airblade/vim-gitgutter'           " shows diff in sidebar

" Themes
Plug 'TroyFletcher/vim-colors-synthwave' " A E S T H E T I C

" to install the newest (versions) plugins, run
" :w
" :so ~/.vimrc
" :PluginInstall

call plug#end()

" colorscheme
colorscheme synthwave 

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
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


" ### plugin configurations
" vim-table-mode
let g:table_mode_corner="|"

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

" automatically install plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" ansible-vim config
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_with_keywords_highlight = 'Constant'