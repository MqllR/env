syntax on
set encoding=utf-8
set background=dark
set belloff=all
set number
set scrolloff=3

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight BadWhitespace ctermbg=red guibg=red

match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/

" no temp or backup files
set noswapfile
set nobackup
set nowritebackup

" Hidden char
set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Python
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set autoindent
au            BufRead *.py set fileformat=unix
au BufRead,BufNewFile *.py let b:comment_leader = '#'
au BufRead,BufNewFile *.py let b:first_line = '# -*- encoding: utf-8 -*-'

" Ruby
au BufNewFile,BufRead *.rb,*.rake,Rakefile set textwidth=79
au BufNewFile,BufRead *.rb,*.rake,Rakefile set autoindent
au            BufRead *.rb,*.rake,Rakefile set fileformat=unix
au BufRead,BufNewFile *.rb,*.rake,Rakefile let b:comment_leader = '#'
au BufRead,BufNewFile *.rb,*.rake,Rakefile let b:first_line= '# frozen_string_literal: true'

" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set autoindent
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!--'

" YAML
au BufRead,BufNewFile *.yaml,*.yml,*.json set autoindent
au         BufNewFile *.yaml,*.yml,*.json set fileformat=unix
au BufRead,BufNewFile *.yaml,*.yml let b:comment_leader = '#'
au BufRead,BufNewFile *.yaml,*.yml let b:first_line = '---'

" JS
au BufRead,BufNewFile *.js set autoindent
au         BufNewFile *.js set fileformat=unix
au BufRead,BufNewFile *.js let b:comment_leader = '//'

" Go
au BufRead,BufNewFile *.go set autoindent
au         BufNewFile *.go set fileformat=unix
au BufRead,BufNewFile *.go let b:comment_leader = '//'

" Comment
noremap <silent> cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> uc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Tab manipulation
nnoremap tn  :tabnew<CR>
nnoremap td  :tabclose<CR>
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tf  :tabfind<Space>
nnoremap tm  :tabm<Space>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

fu! Header()
  call append(0, b:first_line)
endf

" Useful shortcut
noremap , :w<CR>:echo "Saved " strftime("%c") "!" <CR>
noremap cn :cn<CR>
noremap cp :cp<CR>
nmap oo o<Esc>k
nmap OO O<Esc>j
nmap <F5>p :call Header()<CR>

""" Vundle plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'

call vundle#end()
filetype plugin indent on

""" Plugin config
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

map <C-o> :NERDTreeToggle<CR>