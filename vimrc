set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" when you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``--INSERT (paste)--``.

" Rebind <Leader> key
let mapleader = ","

set pastetoggle=<F2>
set clipboard=unnamed


set encoding=utf-8
set backspace=indent,eol,start
filetype off

" Plugin managing using VimPlug
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'bash-support.vim'
Plug 'pangloss/vim-javascript'
Plug 'stanangeloff/php.vim'
" Plug 'joonty/vdebug'
Plug 'shawncplus/phpcomplete.vim'
Plug 'm2mdas/phpcomplete-extended'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'gregsexton/matchtag'
Plug 'scrooloose/syntastic'
Plug '2072/php-indenting-for-vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'
Plug 'vim-ruby/vim-ruby'
call plug#end()

filetype on         " enable filetype detection
filetype plugin on  " enable filetype plugins
filetype indent on	" enable filetype indentation
set nu			" show line numbers
" set relativenumber	" show relative numbers
set cursorline		" highlight current line
set history=50

set t_Co=256
set background=dark
colorscheme Tomorrow-Night-Eighties

" Show whitespace
" Must be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


set ruler
set laststatus=2
set textwidth=79
set shiftwidth=4        " indentation is 4 columns
set tabstop=4           " a tab will be represented with 4 columns
set softtabstop=4       " <tab> is pressed in insert mode 4 columns
set noexpandtab         " tabs are tabs, do not replace with spaces
set shiftround
set autoindent
set hlsearch incsearch

nnoremap <leader><space> :nohlsearch<CR>
set showcmd
set ignorecase
set showmatch
set wildmenu
set lazyredraw
" set list lcs=tab:\|\

" Show hidden files in NERDTREE
let NERDTreeShowHidden=1

" VIM-Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" IdentLine settings
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" phpcomplete-extended setting
" let g:phpcomplete_index_composer_command

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open =1
let g:syntastic_check_on_wq = 0

"emmet-vim settings
let g:user_emmet_leader_key='<C-a>'			" remap <C-Y> to <C-a>
" so new keymap is `Ctrl-a,`

let g:user_emmet_install_global = 0
autocmd FileType html,css, EmmetInstall

" vim-php-namespace settings for inserting "use" statements
function! IPhpInsertUse()
	call PhpInsertUse()
	call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
" hitting `\u` in normal or insert mode will import the class or function under
" the cursor

" Removing all trailing whitespaces by pressing <F5>
" nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
