"Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
syntax on

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2
filetype plugin indent on
syntax on
set t_Co=256

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:netrw_localcopydircmd='cp -r'
let NERDTreeShowHidden=1
let mapleader = ","
nmap <leader>ne :NERDTree<cr>
" air-line
let g:airline_powerline_fonts = 1
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

call plug#begin('~/.config/nvim/')
  " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    Plug 'tpope/vim-rails'
    Plug 'mattn/emmet-vim'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'plasticboy/vim-markdown'
    Plug 'nvim-lua/completion-nvim'
    Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}
    Plug 'yaegassy/coc-pylsp', {'do': 'yarn install --frozen-lockfile'}
    Plug 'rust-lang/rust.vim'

    " Git
    Plug 'airblade/vim-gitgutter'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

    Plug 'tpope/vim-rhubarb'
    Plug 'cohama/lexima.vim'
call plug#end()

" Ctrl+P: Find directory
silent! nmap <C-P> :Files<CR>

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"O

colorscheme nordic

lua << EOF
  	color = color or "nordic"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
EOF
