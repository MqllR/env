set shell=/bin/bash

syntax on
set encoding=utf-8
set background=dark
set belloff=all
set number
set scrolloff=3

highlight LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight BadWhitespace ctermbg=red guibg=red

match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/

" no temp or backup files
set noswapfile
set nobackup
set nowritebackup

" Hidden char
set list
set listchars=eol:⏎,trail:␠,nbsp:⎵

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set splitbelow

" Terminal
" Available in 8.1
if v:version > 800
  au TerminalOpen * if &buftype == 'terminal' | setlocal nolist nonu | endif
endif

" Global
let b:comment_leader = '#'

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
au BufRead,BufNewFile *.rb,*.rake,Rakefile let b:first_line= '# frozen_string_literal: true'

" HTML
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.html set autoindent
au         BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.html let b:comment_leader = '<!--'

" YAML
au BufRead,BufNewFile *.yaml,*.yml,*.json set autoindent
au         BufNewFile *.yaml,*.yml,*.json set fileformat=unix
au BufRead,BufNewFile *.yaml,*.yml let b:first_line = '---'

" JS
au BufRead,BufNewFile *.js,*.ts set autoindent
au         BufNewFile *.js,*.ts set fileformat=unix
au BufRead,BufNewFile *.js,*.ts let b:comment_leader = '//'

" Terraform
au         BufNewFile *.tf,*.tfvars set fileformat=unix
au BufRead,BufNewFile *.tf,*.tfvars let b:comment_leader = '//'

" Go
au         BufNewFile *.go set fileformat=unix
au BufRead,BufNewFile *.go set listchars=tab:.\ ,eol:⏎
au BufRead,BufNewFile *.go set softtabstop=0 noexpandtab
au BufRead,BufNewFile *.go let b:comment_leader = '//'

" Makefile
au         BufNewFile Makefile set fileformat=unix
au BufRead,BufNewFile Makefile set listchars=tab:.\ ,eol:⏎
au BufRead,BufNewFile Makefile set softtabstop=0 noexpandtab

" C-w
nnoremap <C-z> <C-w>
tnoremap <C-z> <C-w>
nmap <C-z><C-z> <C-z><C-w>

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
noremap <F4> :execute "Clap grep ++query=<cword>" <CR>
noremap <F5>p :call Header()<CR>
nmap oo o<Esc>k
nmap OO O<Esc>j

" Clap shortcut
noremap Cf :Clap files ++finder=rg --files --follow --hidden<CR>
noremap CF :Clap filer<CR>
noremap Cg :Clap grep<CR>
noremap Cb :Clap buffers<CR>
noremap Ch :Clap history<CR>

""" Vundle plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'liuchengxu/vim-clap'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/tpope/vim-rhubarb.git'

" Coding
Plugin 'sheerun/vim-polyglot'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-terraform'
Plugin 'neoclide/coc.nvim'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

""" Plugin config
let g:airline_theme='solarized'
let g:terraform_align=1
let g:terraform_fmt_on_save=1
nmap <silent> nt :NERDTreeToggle<CR>

let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = 'material_design_dark'
let g:clap_provider_grep_opts = '--hidden -g "!.git/"'

""" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

""" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

""" Snippets
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-S> <Plug>snipMateShow

let g:snipMate = { 'snippet_version' : 1 }

"""""""""""""""""
"""""""" Coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
