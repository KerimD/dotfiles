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
  " Plug 'vim-airline/vim-airline'
  " Plug 'edkolev/tmuxline.vim'

  " for language syntax highlighting
  Plug 'pangloss/vim-javascript',     { 'for': ['javascript'] }
  Plug 'leafgarland/typescript-vim',  { 'for': ['typescript'] }
  Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript.tsx'] }
  Plug 'neoclide/coc.nvim',           {'branch': 'release'}

  " nerdtree
  Plug 'scrooloose/nerdtree'

  call plug#end()

" -- Plugin Settings -----------------------------------------------------------

  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

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
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" -- Keybindings ---------------------------------------------------------------

  " remove CTRL+T and CTRL+W i'm moving this functionality to tmux
  map <C-t> <Nop>
  map <C-w> <Nop>

  " binding for nerdtree
  nmap <C-n> :NERDTreeToggle<CR>

  nnoremap <Leader>reload :source /home/deniz/.config/nvim/init.vim<CR>
  vnoremap <Leader>copy "+y
  nnoremap <Leader>clog :read /home/deniz/Snippets/consolelog.txt<CR>f(li
  nnoremap <Leader>bcpp :read /home/deniz/Snippets/bcpp.txt<CR>4jA

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
  set splitbelow splitright " open splits below and right
  set mouse=""              " disable mouse

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
  set number         " enables line numbers
  set relativenumber " enables relative line numbers

  " status line
  set laststatus=1  " status bar only shows when more buffers are open

" -- No Clue -------------------------------------------------------------------

  set nocursorline

" -- Mega Usefull --------------------------------------------------------------

  " for like quick selecting a chunk of code see
  " :help object-motions
  " also mega haxs
  " :help object-select
