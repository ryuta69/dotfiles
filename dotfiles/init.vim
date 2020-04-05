"" ----------------------------------------
""	Plugin
"" ----------------------------------------
call plug#begin('~/.config/nvim/plugged/')
	Plug 'tpope/vim-repeat'
	Plug 'ayu-theme/ayu-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'bfredl/nvim-miniyank'
	Plug 'jiangmiao/auto-pairs'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <Leader>t :tabnew<CR>
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
"" ========== AyuVim ==========
colorscheme ayu
let ayucolor="dark"
highlight DiffAdd    gui=none guifg=none    guibg=#003366
highlight DiffDelete gui=bold guifg=#660000 guibg=#660000
highlight DiffChange gui=none guifg=none    guibg=#006666
highlight DiffText   gui=none guifg=none    guibg=#013220

"" ========== FzfVim ==========
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

"" ========== VimPlug ==========
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
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"" ========== EasyMotion ==========
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_enter_jump_first = 1
map <Leader>s <Plug>(easymotion-sn)

"" ========== VimFugitive ==========
set diffopt+=vertical
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>du :diffupdate<CR>
nnoremap <Leader>dgl :diffget //2 \| diffupdate<CR>
nnoremap <Leader>dgr :diffget //3 \| diffupdate<CR>

"" ========== NvimMiniyank ==========
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

"" ========== VimTrailingSpace ==========
nnoremap <Leader>trim :FixWhitespace<CR>
