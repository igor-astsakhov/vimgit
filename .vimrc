set nocompatible
set rtp+=/usr/share/vim/vimfiles
set showtabline=2 " Always display the tabline, even if there is only one tab

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'
" Bundle 'joonty/vdebug.git'
" Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
" Plugin 'ycm-core/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
" Plugin 'shawncplus/phpcomplete.vim'
Plugin 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" to tryout:
" Plugin 'xolox/vim-session'

Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'scrooloose/nerdtree-project-plugin'
Plugin 'PhilRunninger/nerdtree-buffer-ops'
Plugin 'PhilRunninger/nerdtree-visual-selection'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ','

syntax on

set hidden
set wildmenu
set showcmd
set showmatch
set nocp
set encoding=utf-8

let php_sql_query=1
let php_htmlInStrings=1
let g:javascript_plugin_jsdoc = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%03v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

set hlsearch "hls
set ignorecase "ic
set incsearch "is

set smartcase

set backspace=indent,eol,start
set autoindent
set ts=4 sts=4 sw=4 expandtab

set nostartofline
set ruler

set lazyredraw
set laststatus=2

set shiftround
"set visualbell
set ch=2
set virtualedit=all

" remaps
" {                  k
imap <C-d> <C-r>=system('php ~/bin/date.php')<CR>

nmap <leader>r :!phpctags -C ~/.phpctags -R -f ~/myphp.tags /home/mirror ~/vendor<CR>
" nmap <leader>r :tabedit<CR>

nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>f :set fmr={,} fdm=marker<CR>
nnoremap <leader>c :set cursorline!<CR>
nmap <leader>x :set nu!<CR>
nmap <leader>l :set list!<CR>
nmap <leader>s :set spell!<CR>

nmap <leader>o o<ESC>
nmap <leader>O O<ESC>
" Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <F6> :lcd %:p:h<CR>:pwd<CR>
nmap <F7> :nohl<CR>

noremap x "_x
vnoremap p "_dP

nnoremap <c-e> ,
vnoremap <c-e> ,

"cnoremap W :w<CR>
"cnoremap Q :q<CR>
noremap <S-space> <C-u>
noremap <space> <C-d>

map <down> <ESC>:cn<RETURN>
map <left> <ESC>:bp<RETURN>
map <right> <ESC>:bn<RETURN>
map <up> <ESC>:cp<RETURN>
" }

set modifiable
set cpoptions+=$
" colo wombat256
" colo kafka
"colo desert256
colo moonshine_lowcontrast
if has( 'autocmd' )
    filetype on
    filetype indent plugin on
    au BufWritePost .vimrc source $MYVIMRC
    " au FileType php set omnifunc=phpcomplete#CompletePHP
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    au FileType php set nobomb
    au BufEnter,BufNewFile,BufRead *.tpl,*.phtml setfiletype php
    au BufEnter,BufNewFile,BufRead *.icf,*.conf setfiletype conf
    au BufEnter,BufNewFile,BufRead *zone setfiletype bindzone
    au BufEnter,BufNewFile,BufRead sql*,*.txt setfiletype sql
    
    au BufEnter,BufNewFile,BufRead *.crontab setfiletype crontab
    au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
    au BufEnter,BufNewFile,BufRead *.crontab setfiletype crontab
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    au BufWritePre *.php :call <SID>StripTrailingWhitespaces()
endif

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

"set cpt=.
set cpt=.,w,b,t
set shell=bash\ --login

highlight hl ctermbg=red ctermfg=yellow term=bold
hi phpNumber ctermfg=red

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map( synstack(line('.'),col('.')), 'synIDattr(v:val,"name")' )
endfunc

set nu
set list
"set listchars=tab:▸\ ,eol:¬

"nmap <silent> <leader>s :set spell!<CR>

set spelllang=en_us " Set region to British English

set tags=~/myphp.tags;
set t_Co=256 "enable 256 colors in term

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction
nmap <C-S-L> :call SummarizeTabs()<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! ParseMetadata()
    " Do the business:
    %s/\[\|\]//g
    %s/"$/',/g
    %s/NULL$/NULL,/g
    %s/string(\d\+) "/'/g
    %s/\(bool(\|int(\)\(.\+\))/\2,/g
    %s/}$/),/g
    %s/array(\d\+) {/array(/g
    %s/"/'/g
endfunction
nmap <C-S-K> :call ParseMetadata()<CR>

set backup " make backup files
set backupdir=~/.vim/backup// " where to put backup files
set swapfile " make backup files
set directory=~/.vim/tmp// " directory to place swap files in
" set undofile " make undo files
" set undodir=~/.vim/undo// " where to put undo files
set clipboard+=unnamed " share windows clipboard

set history=1000         "" remember more commands and search history
set undolevels=1000      "" use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class ",*.js
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

let g:sqlutil_align_where = 0
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_keyword_case = '\U'

let g:snips_author = 'igor-astsakhov <astahov@gmail.com>'
set pastetoggle=<F2>

if $TERM =~ '^xterm-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif

set term=screen-256color

inoremap jk <ESC>

" new config
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" sessions configs
set sessionoptions-=help
set sessionoptions-=options

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']

let g:miniBufExplForceSyntaxEnable = 1
" set ts=4 sts=4 sw=4 expandtab
