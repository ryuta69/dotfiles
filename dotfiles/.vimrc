"" ----------------------------------------
""	Plugin
"" ----------------------------------------
let s:vimdir   = has('nvim') ? '~/.config/nvim/' : '~/.vim/'
let s:plugdir  = s:vimdir . 'plugged'
let s:plugfile = s:vimdir . 'autoload/plug.vim'
let s:plugurl  = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(s:plugfile))
	silent !echo '[Downloading vim-plug] ...'
	silent execute '!mkdir -p ' . s:vimdir . 'autoload'
	if executable('curl')
		silent execute '!curl -sLo ' . s:plugfile ' ' . s:plugurl
	elseif executable('wget')
		silent execute '!wget -q -O ' . s:plugfile ' ' . s:plugurl
	else
		silent !echo 'vim-plug failed: you need either wget or curl'
		cquit
	endif
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:plugdir)
	Plug 'ulwlu/elly.vim'
	Plug 'mattn/emmet-vim'
	Plug 'bfredl/nvim-miniyank'
	Plug 'tpope/vim-commentary'
	Plug 'mg979/vim-visual-multi'
	Plug 'junegunn/vim-easy-align'
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'ConradIrwin/vim-bracketed-paste'
	Plug 'sheerun/vim-polyglot' | Plug 'ap/vim-css-color'
	Plug 'cohama/lexima.vim' | Plug 'machakann/vim-sandwich'
	Plug 'tpope/vim-fugitive' | Plug 'rhysd/conflict-marker.vim'
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'haya14busa/incsearch.vim' | Plug 'haya14busa/incsearch-fuzzy.vim'
	Plug 'Lokaltog/vim-easymotion' | Plug 'haya14busa/incsearch-easymotion.vim'
	Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
	Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
call plug#end()

"" ----------------------------------------
""	Configure
"" ----------------------------------------
set nobomb
set lazyredraw
set laststatus=0
set termguicolors
set signcolumn=yes
let $LANG='en_US.UTF-8'
let mapleader="\<Space>"
set title titlestring=%F
set splitright splitbelow
set clipboard=unnamedplus
set nowrap formatoptions-=t
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]
set ignorecase wildignorecase
set hidden nobackup noswapfile
set rulerformat=%40(%1*%=%l,%-(%c%V%)\ %=%t%)%*
set noexpandtab tabstop=4 softtabstop=-1 shiftwidth=0
set encoding=utf-8 fileencodings=cp932,sjis,euc-jp,utf-8,iso-2022-jp
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
if has('nvim')
	set inccommand=split
else
	sy on
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
nn Y y$
nn + <C-a>
nn - <C-x>
nn <Up> gk
nn <Down> gj
tno <ESC> <C-\><C-n>
nn <Leader>t :tabnew<CR>
nn <Leader>n :set invnumber<CR>
nn <Leader>1 :diffget LOCAL<CR>
nn <Leader>2 :diffget BASE<CR>
nn <Leader>3 :diffget REMOTE<CR>
nn <Leader>term :split \| terminal<CR>
nn <Leader>sgd :split \| terminal git diff<CR>
nn <Leader>sgp :split \| terminal git log -p<CR>

"" ----------------------------------------
""	PluginSetting
"" ----------------------------------------
"" ========== Theme ==========
colo elly
hi User1 guifg=#3D424D
hi ModeMsg guifg=#3D424D

"" ========== Emmet ==========
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
	\ 'typescript' : { 'extends' : 'jsx' },
	\ 'javascript.jsx' : { 'extends' : 'jsx' }
\ }

"" ========== VimPlug ==========
nn <Leader>clean :PlugClean<CR>
nn <Leader>install :PlugInstall<CR>
nn <Leader>update :PlugUpgrade \| PlugUpdate<CR>

"" ========== Coc.nvim ==========
let g:coc_config_home = "~/.config/coc"
let g:coc_global_extensions = [
	\ 'coc-go',
	\ 'coc-sh',
	\ 'coc-css',
	\ 'coc-git',
	\ 'coc-sql',
	\ 'coc-rls',
	\ 'coc-json',
	\ 'coc-html',
	\ 'coc-perl',
	\ 'coc-vimlsp',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-fzf-preview',
	\ 'coc-markdownlint',
\ ]
nn <Leader>upd :CocUpdate<CR>
nn <Leader>dis :CocDisable<CR>
nm <silent> <Leader>gn <Plug>(coc-git-nextchunk)
nm <silent> <Leader>gp <Plug>(coc-git-prevchunk)
nm <silent> <Leader>dn <Plug>(coc-diagnostic-next)
nm <silent> <Leader>dp <Plug>(coc-diagnostic-prev)
nm <silent> <Leader>cn <Plug>(coc-git-nextconflict)
nm <silent> <Leader>cp <Plug>(coc-git-prevconflict)
nm <silent> <Leader>ch :call CocAction('doHover')<CR>
nm <silent> <Leader>cd :call CocAction('jumpDefinition','split')<CR>

"" ========== Completion ==========
ino <expr> <UP> pumvisible() ? '<C-e><UP>' : '<UP>'
ino <expr> <DOWN> pumvisible() ? '<C-e><DOWN>' : '<DOWN>'
fun! TabComp()
	if pumvisible()
		return "\<C-n>"
	elseif coc#jumpable()
		return "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>"
	else
		return "\<Tab>"
	endif
endfun
im <expr> <Tab> TabComp() | smap <expr> <Tab> TabComp()
fun! TabShiftComp()
	if pumvisible()
		return "\<C-p>"
	elseif coc#jumpable()
		return "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>"
	else
		return "\<S-Tab>"
	endif
endfun
im <expr> <S-Tab> TabShiftComp() | smap <expr> <S-Tab> TabShiftComp()

"" ========== Polyglot ==========
let g:polyglot_excludes = ['csv']

"" ========== EasyAlign ==========
xm ga <Plug>(LiveEasyAlign)
nm ga <Plug>(LiveEasyAlign)

"" ========== EasyMotion ==========
let g:EasyMotion_do_mapping=0
let g:EasyMotion_enter_jump_first=1
map <Leader>s <Plug>(easymotion-sn)
fun! s:config_easyfuzzymotion(...) abort
	return extend(copy({
		\ 'converters': [incsearch#config#fuzzyword#converter()],
		\ 'modules': [incsearch#config#easymotion#module({'overwin': 1})],
		\ 'keymap': {"\<CR>": '<Over>(easymotion)'},
		\ 'is_expr': 0,
		\ 'is_stay': 1
	\ }), get(a:, 1, {}))
endfun
no <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

"" ========== FzfPreview ==========
nnoremap <silent> <Leader>fm :<C-u>CocCommand fzf-preview.Marks<CR>
nnoremap <silent> <Leader>fo :<C-u>CocCommand fzf-preview.OldFiles<CR>
nnoremap <silent> <Leader>gs :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <Leader>ga :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap          <Leader>gr :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
nnoremap <silent> <Leader>ff :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
let g:fzf_preview_disable_mru = 0
let g:fzf_preview_floating_window_rate = 0.8
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap:70%' }
let g:fzf_preview_git_status_preview_command =
	\ "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} | delta || " .
	\ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} | delta || " .
	\ g:fzf_preview_command

"" ========== VimFugitive ==========
set diffopt+=vertical
nn <Leader>gw :Gw<CR>
nn <Leader>gd :Gdiff<CR>
nn <Leader>gp :Gpush<CR>
nn <Leader>gb :Gblame<CR>
nn <Leader>gc :Gcommit<CR>
nn <Leader>du :diffupdate<CR>
nn <Leader>gm :Gdiffsplit!<CR>
nn <Leader>dp :diffput 1 \| diffupdate<CR>
nn <Leader>dgl :diffget //2 \| diffupdate<CR>
nn <Leader>dgr :diffget //3 \| diffupdate<CR>

"" ========== NvimMiniyank ==========
if has("nvim")
	map p <Plug>(miniyank-autoput)
	map P <Plug>(miniyank-autoPut)
endif

"" ========== ConflictMarker ==========
hi ConflictMarkerEnd guibg=#2f628e
hi ConflictMarkerOurs guibg=#2e5049
hi ConflictMarkerBegin guibg=#2f7366
hi ConflictMarkerTheirs guibg=#344f69
hi ConflictMarkerCommonAncestorsHunk guibg=#754a81
let g:conflict_marker_end = '^>>>>>>> .*$'
let g:conflict_marker_begin = '^<<<<<<< .*$'

"" ========== VimTrailingSpace ==========
nn <Leader>trim :FixWhitespace<CR>
