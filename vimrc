set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright
set encoding=utf-8
set nu
set clipboard=unnamed

set foldmethod=indent
set foldlevel=99

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


au BufNewFile,BufRead *.py set tabstop=4 
au BufNewFile,BufRead *.py set softtabstop=4 
au BufNewFile,BufRead *.py set shiftwidth=4 
au BufNewFile,BufRead *.py set textwidth=79 
au BufNewFile,BufRead *.py set expandtab 
au BufNewFile,BufRead *.py set autoindent 
au BufNewFile,BufRead *.py set fileformat=unix

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_server_python_interpreter = 'python2'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'


let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

call togglebg#map("<F5>")

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	  project_base_dir = os.environ['VIRTUAL_ENV']
	  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	  execfile(activate_this, dict(__file__=activate_this))
EOF

