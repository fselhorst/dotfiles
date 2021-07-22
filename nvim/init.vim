let g:is_nvim = has('nvim')
let g:is_vim8 = v:version >= 800 ? 1 : 0
let g:python3_host_prog='/usr/local/bin/python3'
let g:rustfmt_autosave = 1
" Reuse nvim's runtimepath and packpath in vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let mapleader = " "

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}

" only run linters defined
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let NERDTreeQuitOnOpen=1

if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

























"SETS







set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nu 
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set cmdheight=1
set updatetime=50
set t_Co=256
" set background=dark















" PLUGINS









call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'
Plug 'megantiu/true.vim'
Plug 'rakr/vim-one'
Plug 'lewis6991/moonlight.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'rust-lang/rust.vim'
Plug 'cliuj/vim-dark-meadow'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'mhinz/vim-signify'
Plug 'cormacrelf/vim-colors-github'
Plug 'nvim-telescope/telescope.nvim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'stillwwater/vim-nebula'
Plug 'wadackel/vim-dogrun'
Plug 'eemed/sitruuna.vim'
Plug 'glepnir/lspsaga.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
Plug 'vim-test/vim-test'
Plug 'junk-e/identity.vim'

call plug#end()












"LAYOUT





colorscheme low
highlight SignColumn guibg=none ctermbg=NONE
highlight Normal guibg=none ctermbg=NONE
highlight LineNr ctermbg=none guibg=none
hi! NonText ctermbg=NONE guibg=NONE











" REMAPS










"
" Open vim scratch pad
nnoremap <leader>xx <cmd>:e ~/Documents/vimpad.txt<CR>
nnoremap <leader>vi <cmd>:e ~/.config/nvim/init.vim<CR>
" Telescope remaps using lua
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>[ <cmd>tabprevious<cr>
nnoremap <leader>] <cmd>tabnext<cr>
" Space + u for undotree
nnoremap <leader>u <cmd>:UndotreeToggle<CR>

" Navigating splits easy way
nnoremap <leader>h <cmd>:wincmd h<CR>
nnoremap <leader>j <cmd>:wincmd j<CR>
nnoremap <leader>k <cmd>:wincmd k<CR>
nnoremap <leader>l <cmd>:wincmd l<CR>

" NERDTreeFind automatically highlights open tab file
nnoremap <leader>fe <cmd>:NERDTreeFind<CR>

nnoremap <leader>dm <cmd>:colors gruvbox<bar> :set background=dark <cr>
nnoremap <leader>lm <cmd>:colors one<bar> :set background=light <cr>
" preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" show diagnostics
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" jump through diagnostics
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" test nearest jest
nnoremap <leader>tn <cmd>:TestNearest<CR>
nnoremap <leader>tf <cmd>:TestFile<CR>

" Prettier stuff












" AUTOCOMMANDS











" this command allows you to run :Prettier in vim

" some magic telescope preview needs
autocmd User TelescopePreviewerLoaded setlocal wrap








" lsp saga
lua require('lspsaga').init_lsp_saga()

" Avoid showing extra messages when using completion
set shortmess+=c
" autocomplete lsp setup
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require('lspconfig').tsserver.setup{ on_attach=require'completion'.on_attach }
lua require('lspconfig').rust_analyzer.setup{ on_attach=require'completion'.on_attach }
