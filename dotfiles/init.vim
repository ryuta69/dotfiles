"" ----------------------------------------
""	Plugin
"" ----------------------------------------
call plug#begin('~/.config/nvim/plugged/')
	Plug 'tpope/vim-repeat'
	Plug 'SirVer/ultisnips'
	Plug 'junegunn/fzf.vim'
	Plug 'ayu-theme/ayu-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'honza/vim-snippets'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'bfredl/nvim-miniyank'
	Plug 'jiangmiao/auto-pairs'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'prabirshrestha/async.vim'
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'thomasfaingnaert/vim-lsp-snippets'
	Plug 'thomasfaingnaert/vim-lsp-ultisnips'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

"" ----------------------------------------
""	Configure
"" ----------------------------------------
set nobomb
set hidden
set nobackup
set smartcase
set ignorecase
set lazyredraw
set noswapfile
set splitright
set splitbelow
set termguicolors
set tabstop=8
set shiftwidth=8
set scrolloff=20
set encoding=utf-8
set inccommand=split
let $LANG='en_US.UTF-8'
let mapleader="\<Space>"
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]
set fileencodings=cp932,sjis,euc-jp,utf-8,iso-2022-jp
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" ----------------------------------------
""	Mapping
"" ----------------------------------------
nnoremap Y y$
nnoremap <C-e> $
nnoremap <C-a> 0
nnoremap <C-f> W
nnoremap <C-b> B
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <Leader>t :tabnew<CR>
nnoremap <silent> <Tab> 15<Right>
nnoremap <silent> <S-Tab> 15<Left>
nnoremap <Leader>1 :diffget LOCAL<CR>
nnoremap <Leader>2 :diffget BASE<CR>
nnoremap <Leader>3 :diffget REMOTE<CR>
nnoremap <Leader>code :!code %:p<CR>
nnoremap <Leader>wkdir :!code -r %:p:h<CR>
nnoremap <Leader>sh :split \| terminal<CR>
map <Leader>\ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"" ----------------------------------------
""	PluginSetting
"" ----------------------------------------
"" ========== Ayu Vim ==========
colorscheme ayu
let ayucolor="dark"
highlight DiffAdd    gui=none guifg=none    guibg=#003366
highlight DiffDelete gui=bold guifg=#660000 guibg=#660000
highlight DiffChange gui=none guifg=none    guibg=#006666
highlight DiffText   gui=none guifg=none    guibg=#013220

"" ========== Fzf Vim ==========
nnoremap <Leader>file :Files<CR>
nnoremap <Leader>hist :History<CR>
let g:fzf_layout = { 'right': '~50%' }
function! Rg()
	let string = input('Search String: ')
	call fzf#run(fzf#wrap({
		\ 'source': 'rg -lin ' . string,
		\ 'options': '--preview-window bottom:50% --preview "rg -in --color=always ' . string . ' {}"'}))
endfunction
nnoremap <Leader>rg :call Rg()<CR>
command! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview('down:50%'))
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:50%'), <bang>0)

"" ========== Vim LSP ==========
nnoremap <Leader>lsphv :LspHover<CR>
nnoremap <Leader>lspst :LspStatus<CR>
nnoremap <Leader>lspup :LspInstallServer<CR>
nnoremap <Leader>lspfm :LspDocumentFormat<CR>
nnoremap <Leader>lspdf :LspPeekDefinition<CR>

"" ========== Vim Plug ==========
nnoremap <Leader>clean :PlugClean<CR>
nnoremap <Leader>update :PlugUpdate<CR>
nnoremap <Leader>install :PlugInstall<CR>

"" ========== Deoplete ==========
let g:deoplete#enable_at_startup = 1
inoremap <expr> <up>    pumvisible() ? '<c-e><up>'   : '<up>'
inoremap <expr> <down>  pumvisible() ? '<c-e><down>' : '<down>'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>"      : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>"      : "\<S-Tab>"

"" ========== Ultisnips ==========
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger="<c-f>"

"" ========== Easy Motion ==========
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_enter_jump_first = 1
map <Leader>s <Plug>(easymotion-sn)

"" ========== Vim Fugitive ==========
set diffopt+=vertical
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>du :diffupdate<CR>
nnoremap <Leader>dgl :diffget //2 \| diffupdate<CR>
nnoremap <Leader>dgr :diffget //3 \| diffupdate<CR>

"" ========== Nvim Miniyank ==========
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

"" ========== Vim Trailing Space ==========
nnoremap <Leader>trim :FixWhitespace<CR>
