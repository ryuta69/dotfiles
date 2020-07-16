"" ----------------------------------------
""	Plugin
"" ----------------------------------------
let plugdir=has('nvim') ? '~/.config/nvim/plugged/' : '~/.vim/plugged'
call plug#begin(plugdir)
	Plug 'mattn/emmet-vim'
	Plug 'cohama/lexima.vim'
	Plug 'ayu-theme/ayu-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'
	Plug 'machakann/vim-sandwich'
	Plug 'junegunn/vim-easy-align'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'sheerun/vim-polyglot' | Plug 'ap/vim-css-color'
	Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ'
	Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	if has('nvim')
		Plug 'bfredl/nvim-miniyank'
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'roxma/nvim-yarp'
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
call plug#end()

"" ----------------------------------------
""	Configure
"" ----------------------------------------
set nobomb
set lazyredraw
set laststatus=0
set termguicolors
let $LANG='en_US.UTF-8'
let mapleader="\<Space>"
set title titlestring=%F
set splitright splitbelow
set clipboard=unnamedplus
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]
set hidden nobackup noswapfile
set smartcase ignorecase wildignorecase
set rulerformat=%40(%=%l,%-(%c%V%)\ %=%t%)%*
set noexpandtab tabstop=4 softtabstop=-1 shiftwidth=0
set encoding=utf-8 fileencodings=cp932,sjis,euc-jp,utf-8,iso-2022-jp
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
if has('nvim')
	set inccommand=split
else
	syntax on
	set ttyfast
	set autoread
	set wildmenu
	set belloff=all
	set ruler showcmd
	set hlsearch incsearch
	filetype plugin indent on
	set backspace=indent,eol,start
endif

"" ----------------------------------------
""	Mapping
"" ----------------------------------------
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <Up> gk
nnoremap <Down> gj
tnoremap <ESC> <C-\><C-n>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>1 :diffget LOCAL<CR>
nnoremap <Leader>2 :diffget BASE<CR>
nnoremap <Leader>3 :diffget REMOTE<CR>
nnoremap <Leader>code :!code %:p<CR>
nnoremap <Leader>dir  :!code -r %:p:h<CR>
nnoremap <Leader>term :split \| terminal<CR>
map <Leader>\ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"" ----------------------------------------
""	PluginSetting
"" ----------------------------------------
"" ========== AyuVim ==========
let ayucolor='dark'
colorscheme ayu
highlight Normal      guibg=#0A0E14
highlight FoldColumn  guibg=#0A0E14
highlight EndOfBuffer ctermfg=0 guifg=bg
highlight DiffAdd     gui=NONE  guifg=NONE    guibg=#003366
highlight DiffDelete  gui=bold  guifg=#660000 guibg=#660000
highlight DiffChange  gui=NONE  guifg=NONE    guibg=#006666
highlight DiffText    gui=NONE  guifg=NONE    guibg=#013220

"" ========== FzfVim ==========
nnoremap <Leader>file :Files<CR>
nnoremap <Leader>hist :History<CR>
nnoremap <Leader>rg   :call Rg()<CR>
let g:fzf_layout={'right': '~45%'}
command! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview('down:50%'))
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:50%'), <bang>0)
function! Rg()
	let string=input('Search String: ')
	call fzf#run(fzf#wrap({
		\ 'source': 'rg -lin ' . string,
		\ 'options': '--preview-window bottom:60% --preview "rg -in --color=always ' . string . ' {}"'
	\ }))
endfunction

"" ========== VimPlug ==========
nnoremap <Leader>clean   :PlugClean<CR>
nnoremap <Leader>update  :PlugUpdate<CR>
nnoremap <Leader>install :PlugInstall<CR>

"" ========== Emmet ==========
let g:user_emmet_settings = {
	\ 'typescript'     : { 'extends' : 'jsx' },
	\ 'javascript.jsx' : { 'extends' : 'jsx' }
\ }

"" ========== Vsnip ==========
nnoremap <Leader>vop :VsnipOpen<CR>
imap <expr> <C-R>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<CR>'
imap <expr> <C-R>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<CR>'
smap <expr> <C-R>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<CR>'
imap <expr> <TAB>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <TAB>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-TAB> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-TAB> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

"" ========== Deoplete ==========
let g:deoplete#enable_at_startup = 1
inoremap <expr> <UP>   pumvisible() ? '<C-e><UP>'   : '<UP>'
inoremap <expr> <DOWN> pumvisible() ? '<C-e><DOWN>' : '<DOWN>'
inoremap <silent><expr> <TAB>   pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr> <S-TAB> pumvisible() ? '<C-p>' : '<S-TAB>'

"" ========== Polyglot ==========
let g:polyglot_excludes = ['csv']

"" ========== Sandwich ==========
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

"" ========== EasyAlign ==========
xmap ga <Plug>(LiveEasyAlign)
nmap ga <Plug>(LiveEasyAlign)

"" ========== EasyMotion ==========
let g:EasyMotion_do_mapping=0
let g:EasyMotion_enter_jump_first=1
map <Leader>s <Plug>(easymotion-sn)

"" ========== VimFugitive ==========
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>ga  :Gwrite<CR>
nnoremap <Leader>gb  :Gblame<CR>
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>dp  :diffput<CR>
nnoremap <Leader>du  :diffupdate<CR>
nnoremap <Leader>dgl :diffget //2 \| diffupdate<CR>
nnoremap <Leader>dgr :diffget //3 \| diffupdate<CR>
set diffopt+=vertical

"" ========== NvimMiniyank ==========
if has("nvim")
	map p <Plug>(miniyank-autoput)
	map P <Plug>(miniyank-autoPut)
endif

"" ========== VimTrailingSpace ==========
nnoremap <Leader>trim :FixWhitespace<CR>
