" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number
set ruler
set hlsearch

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'scrooloose/nerdtree'
Plug 'vim-utils/vim-husk' | Plug 'tpope/vim-rsi' " Eamcs-Style keymapping
nmap <C-\> :NERDTreeToggle<CR>
" Quit when nerdtree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'mhinz/vim-startify'
" Shot nerdtree when start vim without argument
autocmd VimEnter *
            \ if !argc()
        "    \ |   Startify
       "     \ |   NERDTree
            \ |   wincmd w
            \ | endif
Plug 'scrooloose/nerdcommenter' | Plug 'tpope/vim-commentary'
nnoremap <c-_> :call NERDComment(0, "toggle")<CR>j
vnoremap <c-_> :call NERDComment(0, "toggle")<CR>j
Plug 'junegunn/vim-github-dashboard'

" Smart space mapping
" Notice: when starting other <Space> mappings in noremap, disappeared [Space]
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>
" key map ^,$ to <Space>h,l. Because ^ and $ is difficult to type and damage little finger!!!
noremap [Space]h ^
noremap [Space]l $
inoremap jk <Esc>
command PI PlugInstall
command! PU PlugUpgrade | PlugUpdate

call plug#end()

" Emacs style key mapping
 inoremap <C-a> <Home>
 inoremap <C-e> <End>
 inoremap <leader>a <End>
 inoremap <leader>e <End>
 inoremap <C-h> <BS>
 inoremap <C-d> <Del>
 inoremap <C-f> <Right>
 inoremap <C-b> <Left>
 " In insert mode, pressing Ctrl-O switches to normal mode for one command, then switches back to insert mode when the command is finished.
 inoremap <C-k> <C-o>D
 inoremap <C-u> <Esc>v0c
   " Quickly move in normal mode
 noremap <c-j> <c-y>
 noremap <c-k> <c-e>
 noremap <c-e> A
 noremap <c-a> I
   " Paste multiple times
 xnoremap p pgvy

colorscheme gruvbox
set background=dark
