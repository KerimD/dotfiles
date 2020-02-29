"        _
"       (_)
" __   ___ _ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

  " must be set before using <Leader> in keybindings
  let mapleader="\<Space>"

  " remove this dumbass key
  nmap <F1> <nop>
  imap <F1> <nop>

" -- Plugins -------------------------------------------------------------------

  call plug#begin()

  " vim + tmux synergy
  Plug 'christoomey/vim-tmux-navigator'

  " for styling
  Plug 'dracula/vim', { 'as': 'dracula' }
  " Plug 'vim-airline/vim-airline'
  " Plug 'edkolev/tmuxline.vim'

  " for language syntax highlighting
  Plug 'pangloss/vim-javascript',      { 'for': ['javascript'] }
  Plug 'leafgarland/typescript-vim',   { 'for': ['typescript'] }
  Plug 'peitalin/vim-jsx-typescript',  { 'for': ['typescript.tsx'] }
  Plug 'neoclide/coc.nvim',            {'branch': 'release'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

  " nerdtree
  Plug 'scrooloose/nerdtree'

  call plug#end()

" -- Plugin Settings -----------------------------------------------------------

  """"""""""""""""""""""""""
  "    markdown-preview    "
  """"""""""""""""""""""""""

  " set to 1, nvim will open the preview window after entering the markdown buffer
  " default: 0
  let g:mkdp_auto_start = 0

  " set to 1, the nvim will auto close current preview window when change
  " from markdown buffer to another buffer
  " default: 1
  let g:mkdp_auto_close = 1

  " set to 1, the vim will refresh markdown when save the buffer or
  " leave from insert mode, default 0 is auto refresh markdown as you edit or
  " move the cursor
  " default: 0
  let g:mkdp_refresh_slow = 0

  " set to 1, the MarkdownPreview command can be use for all files,
  " by default it can be use in markdown file
  " default: 0
  let g:mkdp_command_for_global = 0

  " set to 1, preview server available to others in your network
  " by default, the server listens on localhost (127.0.0.1)
  " default: 0
  let g:mkdp_open_to_the_world = 0

  " use custom IP to open preview page
  " useful when you work in remote vim and preview on local browser
  " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  " default empty
  let g:mkdp_open_ip = ''

  " specify browser to open preview page
  " default: ''
  let g:mkdp_browser = ''

  " set to 1, echo preview page url in command line when open preview page
  " default is 0
  let g:mkdp_echo_preview_url = 0

  " a custom vim function name to open preview page
  " this function will receive url as param
  " default is empty
  let g:mkdp_browserfunc = ''

  " options for markdown render
  " mkit: markdown-it options for render
  " katex: katex options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: if disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: mean the cursor position alway show at the middle of the preview page
  "   top: mean the vim top viewport alway show at the top of the preview page
  "   relative: mean the cursor position alway show at the relative positon of the preview page
  " hide_yaml_meta: if hide yaml metadata, default is 1
  " sequence_diagrams: js-sequence-diagrams options
  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {}
      \ }

  " use a custom markdown style must be absolute path
  let g:mkdp_markdown_css = ''

  " use a custom highlight style must absolute path
  let g:mkdp_highlight_css = ''

  " use a custom port to start server or random for empty
  let g:mkdp_port = ''

  " preview page title
  " ${name} will be replace with the file name
  let g:mkdp_page_title = '「${name}」'

  """""""""""""
  "    COC    "
  """""""""""""

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
  set signcolumn=auto

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

  " binding for nerdtree
  nmap <C-n> :NERDTreeToggle<CR>

  noremap Y y$

  " put the other side
  " inoremap ( ()<Esc>i
  " inoremap { {}<Esc>i

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

  set noexpandtab             " use spaces instead of tabs
  set smarttab

  set nowrap
  set textwidth=80          " autowrap after 80 chars
  set history=500           " lines of history to remember
  set splitbelow splitright " open splits below and right
  set mouse=n               " disable mouse
  set scrolloff=4           " show # lines while scrolling down

" -- Auto Commands -------------------------------------------------------------
" autocmd [group] {events} {file_pattern} [++nested] {command}

  " refresh polybar
  " autocmd BufWritePost testBar.ini !$HOME/.config/polybar/scripts/testBar.sh

  " remove trailling whitespace on save
  " autocmd BufWritePre * %s/\s\+$//e

  " set config files to dosini filetype
  autocmd BufReadPost config set filetype=dosini

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
