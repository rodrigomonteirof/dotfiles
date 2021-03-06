set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","

" no swp files
set noswapfile

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
Plugin 'compactcode/alternate.vim'
Plugin 'compactcode/open.vim'
Plugin 'ajmwagar/vim-dues'
Plugin 'tpope/vim-sensible'
Plugin 'morhetz/gruvbox'

call vundle#end()            " required

" Color
colorscheme gruvbox
set background=dark

" Rspec
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "!bundle exec rspec {spec}"

" Alternate
nnoremap <Leader>r :Open(alternate#FindAlternate())<CR>
nnoremap <Leader>e :OpenVertical(alternate#FindAlternate())<CR>

" Highlight Whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Indent Settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
filetype plugin indent on

" Buffer
map <Leader>b :CtrlPBuffer<CR>

" 80 Column
:set textwidth=80
:set colorcolumn=+1

" Rubocop
let g:vimrubocop_keymap = 0
nnoremap <leader>q :RuboCop<CR>

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" All of your Plugins must be added before the following line
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
