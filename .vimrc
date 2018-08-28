syntax on
set encoding=utf-8
set background=dark

highlight BadWhitespace ctermbg=red guibg=red

" no temp or backup files
set noswapfile
set nobackup
set nowritebackup

" Python
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au            BufRead *.rb set fileformat=unix
au BufNewFile,BufRead *.py set softtabstop=4
au BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py let b:comment_leader = '#'

" Ruby
au BufNewFile,BufRead *.rb set tabstop=4
au BufNewFile,BufRead *.rb set softtabstop=4
au BufNewFile,BufRead *.rb set shiftwidth=4
au BufNewFile,BufRead *.rb set textwidth=79
au BufNewFile,BufRead *.rb set expandtab
au BufNewFile,BufRead *.rb set autoindent
au            BufRead *.rb set fileformat=unix
au BufNewFile,BufRead *.rb set softtabstop=4
au BufRead,BufNewFile *.rb match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.rb match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.rb let b:comment_leader = '#'

" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=2
au BufRead,BufNewFile *.html set softtabstop=2
au BufRead,BufNewFile *.html set shiftwidth=2
au BufRead,BufNewFile *.html set autoindent
au BufRead,BufNewFile *.html match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.html match BadWhitespace /\s\+$/
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!--'

" YAML
au BufRead,BufNewFile *.yaml,*.yml set expandtab
au BufRead,BufNewFile *.yaml,*.yml set tabstop=2
au BufRead,BufNewFile *.yaml,*.yml set softtabstop=2
au BufRead,BufNewFile *.yaml,*.yml set shiftwidth=2
au BufRead,BufNewFile *.yaml,*.yml set autoindent
au BufRead,BufNewFile *.yaml,*.yml match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.yaml,*.yml match BadWhitespace /\s\+$/
au         BufNewFile *.yaml,*.yml set fileformat=unix
au BufRead,BufNewFile *.yaml,*.yml let b:comment_leader = '#'

" Web
au BufRead,BufNewFile *.js set expandtab
au BufRead,BufNewFile *.js set tabstop=4
au BufRead,BufNewFile *.js set softtabstop=4
au BufRead,BufNewFile *.js set shiftwidth=4
au BufRead,BufNewFile *.js set autoindent
au BufRead,BufNewFile *.js match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.js match BadWhitespace /\s\+$/
au         BufNewFile *.js set fileformat=unix
au BufRead,BufNewFile *.js let b:comment_leader = '//'

noremap <silent> cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> uc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
noremap , :w<CR>:echo "Saved " strftime("%c") "!" <CR>

fu! PyHeader()
  exec("normal gg O#!/usr/bin/env python\n\n")
  exec("normal a# -*- encoding: utf-8 -*-\n\n")
endf

" Just add a newline before / after
nmap oo o<Esc>k
nmap OO O<Esc>j

nmap <F5>p :call PyHeader()<CR>
