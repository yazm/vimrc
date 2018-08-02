set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" 语法检查
Plugin 'vim-syntastic/syntastic'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/tComment'
Plugin 'scrooloose/nerdtree'

" vim状态提示栏
Plugin 'Lokaltog/vim-powerline'

" 代码块自动补全
" Plugin 'msanders/snipmate.vim'

" 符号自动补全
Plugin 'Raimondi/delimitMate'
" Plugin 'evanmiller/nginx-vim-syntax'
" Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'

" Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
syntax enable
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set list listchars=tab:»·,trail:·
" 自动关闭补全弹窗
set completeopt=menu,noinsert
colorscheme molokai

" jump to the last position when reopen a file
if  has("autocmd")
    au BufReadPost * exe "normal! g`\""
endif

set number
set numberwidth=5

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

set splitbelow
set splitright
set hlsearch
" nohlsearch shortcut
nmap -hl :nohlsearch<cr>
nmap +hl :set hlsearch<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" taglist setting
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
" let Tlist_Auto_Open=1
nnoremap <F8> :TlistToggle<CR>

" nerdtree setting
" map <C-n> :NERDTreeToggle<CR>
nmap <F5> :NERDTreeToggle<cr>
