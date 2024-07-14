" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" JS plugins
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'suy/vim-context-commentstring', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'alvan/vim-closetag', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Graphql plugins
Plug 'jparise/vim-graphql'

" Go plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go', 'golang' ]}
Plug 'uarun/vim-protobuf'

" LSP
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Theme
Plug 'mhartington/oceanic-next'

Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'roman/golden-ratio'


" Productivity 
Plug 'wakatime/vim-wakatime'

" Initialize plugin system
call plug#end()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax on
colorscheme OceanicNext

" Settings
set clipboard+=unnamedplus
" set nu
let mapleader=" "

" Fzf Config
nnoremap <silent> <c-p> :Files<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" js
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType javascriptreact set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType typescript set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType typescriptreact set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType css set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType scss set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType sasss set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent
autocmd FileType markdown set tabstop=2|set shiftwidth=2|set expandtab|set smarttab|set cindent

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
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

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
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
