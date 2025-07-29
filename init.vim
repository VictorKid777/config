"==============================================================================
" vim-plug setup
"==============================================================================
call plug#begin('~/.local/share/nvim/plugged')

" Essentials
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax & Filetype support
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript' " For TSX syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Quality of Life
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'

" Theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

"==============================================================================
" Basic Settings
"==============================================================================
set nocompatible
set clipboard=unnamedplus
filetype plugin indent on
syntax on
colorscheme catppuccin-mocha " catppuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" Tabs & Indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number

" UI
set cursorline
set termguicolors " Enable true colors

" Buffer navigation
nnoremap <Space>1 :tabn 1<CR>
nnoremap <Space>2 :tabn 2<CR>
nnoremap <Space>3 :tabn 3<CR>
nnoremap <Space>4 :tabn 4<CR>
nnoremap <Space>5 :tabn 5<CR>
nnoremap <Space>6 :tabn 6<CR>
nnoremap <Space>7 :tabn 7<CR>

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

"==============================================================================
" Plugin Configuration
"==============================================================================

" fzf - Map Ctrl+P to open the file finder
nnoremap <C-p> :Files<CR>

" coc.nvim
" Automatically install CoC extensions for React/TypeScript development
let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-json']

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use Tab to confirm completion
inoremap <silent><expr> <TAB> pumvisible() ? coc#pum#confirm() : "\<TAB>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" vim-visual-multi - Multi-cursor support
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'



" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Format selected code with Prettier
xmap <space>f <Plug>(coc-format-selected)

"==============================================================================
" nvim-treesitter & Comment.nvim
"==============================================================================
let g:skip_ts_context_commentstring_module = 1
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "tsx", "json", "css", "html" },
  highlight = {
    enable = true,
  },
}

require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
EOF


