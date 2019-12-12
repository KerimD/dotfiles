"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

  " must be set before using <Leader> in keybindings
  let mapleader="\<Space>"

" -- Plugins -------------------------------------------------------------------

  call plug#begin()

  " vim + tmux synergy
  Plug 'christoomey/vim-tmux-navigator'

  " for styling
  Plug 'dracula/vim', { 'as': 'dracula' }

  " for language syntax highlighting
  Plug 'pangloss/vim-javascript',     { 'for': ['javascript'] }
  Plug 'leafgarland/typescript-vim',  { 'for': ['typescript'] }
  Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript.tsx'] }

  " nerdtree
  Plug 'scrooloose/nerdtree'

  call plug#end()

" -- Plugin Settings -----------------------------------------------------------

  " turns on Filetype detection, filetype pligins, indent files
  filetype plugin indent on

" -- Keybindings ---------------------------------------------------------------

  " binding for nerdtree
  nmap <C-n> :NERDTreeToggle<CR>

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

  " https://www.reddit.com/r/vim/wiki/tabstop
  set tabstop=8
  set softtabstop=2
  set shiftwidth=2
  set expandtab             " use spaces instead of tabs
  set smarttab

  set nowrap
  set textwidth=80          " autowrap after 80 chars
  set history=500           " lines of history to remember
  set splitbelow splitright " open vertical split to right
  set mouse=a               " allow mouse in all modes

" -- Auto Commands -------------------------------------------------------------

  " remove trailling whitespace on save
  autocmd BufWritePre * %s/\s\+$//e

  " set filetype for tsx and jsx files to both be typescript.tsx
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" -- Appearance ----------------------------------------------------------------

  set t_Co=256       " enable 256 color
  color dracula      " dracula color scheme
  set termguicolors  " to fix dracula theme colors
  syntax enable      " enables colors for syntax
  set colorcolumn=81 " show line at 81 chars
  set laststatus=1   " status bar only shows when more buffers are open
  set number relativenumber

" -- No Clue -------------------------------------------------------------------

  set nocursorline
  set hidden

" -- Mega Usefull --------------------------------------------------------------

  " for like quick selecting a chunk of code see
  " :help object-motions
  " also mega haxs
  " :help object-select
