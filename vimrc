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
nmap <C-\> :NERDTreeToggle<CR>
" Quit when nerdtree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'mhinz/vim-startify'
" Shot nerdtree when start vim without argument
autocmd VimEnter *
            \ if !argc()
            \ |   Startify
            \ |   NERDTree
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


colorscheme gruvbox
set background=dark
