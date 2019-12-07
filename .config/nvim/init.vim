" ~/.config/nvim/init.vim

" -- Plugins -------------------------------------------------------------------

  call plug#begin()

  " vim + tmux synergy
  Plug 'christoomey/vim-tmux-navigator'

  " for styling
  Plug 'dracula/vim', { 'as': 'dracula' }
  "Plug 'Yggdroot/indentLine'

  " for language syntax highlighting
  Plug 'pangloss/vim-javascript',     { 'for': ['javascript'] }
  Plug 'leafgarland/typescript-vim',  { 'for': ['typescript'] }
  Plug 'peitalin/vim-jsx-typescript', { 'for': ['javascript.jsx', 'typescript.tsx'] }

  " nerdtree
  Plug 'scrooloose/nerdtree'

  call plug#end()

" -- Plugin Settings -----------------------------------------------------------

  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files
  set nobackup
  set nowritebackup

  " treat jsx files as tsx files
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

  " binding for nerdtree
  map <C-n> :NERDTreeToggle<CR>

" -- Keybindings ---------------------------------------------------------------

  " changing mapleader from "\\"
  " must be set before using <Leader> in following bindings
  let mapleader="\<Space>"

  nnoremap <Leader>reload :source /home/deniz/.config/nvim/init.vim<CR>
  vnoremap <Leader>copy "+y
  nnoremap <Leader>clog :read /home/deniz/Snippets/consolelog.txt<CR>f(li

  " a test for tutorial purposes
  nnoremap <Leader>potato :-1read /home/deniz/Snippets/potato.txt<CR>
  " n = command is run in normal mode
  " nore = make sure the command doesn't call itself recursively
  " map = remap keybinding
  " <Leader>potato = the command
  " : = run this in normal mode (this takes you to command mode)
  " -1 = goes up one line or something
  " read = command that reads a file and puts it into where your cursor is
  " <CR> = carrage return (enter key) (runs command which takes you back to
  " normal mode)
  " i = runs this in normal mode (so we go into insert mode)
  " more :help map

" -- General -------------------------------------------------------------------

  " search into subfolders and provides tab completion
  " ** is for recursive search in directory
  set path+=**

  " display amtching files when we tab complete
  " also you can do fuzzy search *.py findes all py files
  set wildmenu

  " now :cd into a directory with autocomplete and :find <file> with
  " autocomplete. check buffer with :ls and switch with :b <file>

  " https://www.reddit.com/r/vim/wiki/tabstop
  set tabstop=8
  set softtabstop=2
  set shiftwidth=2

  " use spaces instead of tabs
  set expandtab

  " no wrap
  set nowrap

  " lines of history to remember
  set history=500

  " open vertical split to right
  set splitbelow splitright

  " set relative number
  set number relativenumber

  " allow mouse in all modes
  set mouse=a

  " turns on Filetype detection, filetype pligins, indent files
  filetype plugin indent on

  " functions completion
  set omnifunc=syntaxcomplete#Complete

" -- Auto Commands -------------------------------------------------------------

  " remove trailling whitespace on save
  autocmd BufWritePre * %s/\s\+$//e

" -- Appearance ----------------------------------------------------------------

  " enable 256 color
  set t_Co=256

  " general scheme
  color dracula

  " to fix dracula theme colors
  set termguicolors

  " enables colors for syntax
  syntax on

  " show line at 81 chars
  set colorcolumn=81

  " autowrap after 80 chars
  set textwidth=80

  " show line numbers
  set number

  " status bar only shows when more buffers are open. options = 0, 1, 2
  set laststatus=1

" -- No Clue -------------------------------------------------------------------

  set nocursorline

" -- Mega Usefull --------------------------------------------------------------

  " autocomplete is ^n or ^p
  " for help, :help ins-completion
  " ^x^f is for file completion

  " for like quick selecting a chunk of code see
  " :help object-motions
  " also mega haxs
  " :help object-select

  " also ctags with ^] or ^Click
  " basically tag jumping

