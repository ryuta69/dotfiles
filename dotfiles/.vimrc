"" ----------------------------------------
""  Plugin
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
    silent !echo 'vim-plug failed: you need either wget or curl' | cquit
  endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:plugdir)
  Plug 'ulwlu/elly.vim'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-commentary'
  Plug 'bfredl/nvim-miniyank'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'ap/vim-css-color' | Plug 'sheerun/vim-polyglot'
  Plug 'cohama/lexima.vim' | Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-fugitive' | Plug 'rhysd/conflict-marker.vim'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
call plug#end()

"" ----------------------------------------
""  Configure
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
set fileformats=unix,dos,mac
set whichwrap=b,s,h,l,<,>,[,]
set ignorecase wildignorecase
set hidden nobackup noswapfile
set rulerformat=%40(%1*%=%F%)%*
set expandtab tabstop=2 softtabstop=2 shiftwidth=2 smartindent
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
""  Mapping
"" ----------------------------------------
nn Y y$
tno <ESC> <C-\><C-n>
nn + <C-a>| nn - <C-x>
nn <Up> gk| nn <Down> gj
nn <Leader>n :set invnumber<CR>
nn <Leader>sh :split \| terminal<CR>
nn <Leader>sg :split \| terminal git diff<CR>
nn <Leader>uu :resize +5<CR>| nn <Leader>dd :resize -5<CR>
nn <Leader>rr :vertical resize -5<CR>| nn <Leader>ll :vertical resize +5<CR>

"" ----------------------------------------
""  PluginSetting
"" ----------------------------------------
"" ========== Theme ==========
colo elly
hi User1 guifg=#545759

"" ========== Emmet ==========
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
  \ 'typescript' : { 'extends' : 'jsx' },
  \ 'javascript.jsx' : { 'extends' : 'jsx' }
\ }

"" ========== VimPlug ==========
nn <Leader>clean :PlugClean<CR>
nn <Leader>inst :PlugInstall<CR>
nn <Leader>upd :PlugUpgrade \| PlugUpdate<CR>

"" ========== Coc.nvim ==========
let g:coc_config_home = "~/.config/coc"
let g:coc_global_extensions = [
  \ 'coc-go',
  \ 'coc-css',
  \ 'coc-git',
  \ 'coc-rls',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-docker',
  \ 'coc-python',
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-fzf-preview',
\ ]
nn <Leader>cup :CocUpdate<CR>
nn <Leader>cdi :CocDisable<CR>
nn <Leader>ee :CocCommand explorer<CR>
nm <silent> <Leader>gn <Plug>(coc-git-nextchunk)
nm <silent> <Leader>gp <Plug>(coc-git-prevchunk)
nm <silent> <Leader>cn <Plug>(coc-diagnostic-next)
nm <silent> <Leader>cp <Plug>(coc-diagnostic-prev)
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
im <expr> <Tab> TabComp()| smap <expr> <Tab> TabComp()
fun! TabShiftComp()
  if pumvisible()
    return "\<C-p>"
  elseif coc#jumpable()
    return "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>"
  else
    return "\<S-Tab>"
  endif
endfun
im <expr> <S-Tab> TabShiftComp()| smap <expr> <S-Tab> TabShiftComp()

"" ========== Polyglot ==========
let g:polyglot_excludes = ['csv']

"" ========== FzfPreview ==========
nn <silent> <Leader>fm :<C-u>CocCommand fzf-preview.Marks<CR>
nn <silent> <Leader>fo :<C-u>CocCommand fzf-preview.OldFiles<CR>
nn <silent> <Leader>gs :<C-u>CocCommand fzf-preview.GitStatus<CR>
nn <silent> <Leader>ga :<C-u>CocCommand fzf-preview.GitActions<CR>
nn          <Leader>gr :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
nn <silent> <Leader>ff :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
let g:fzf_preview_disable_mru = 0
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
nn <Leader>dl :diffget //2 \| diffupdate<CR>
nn <Leader>dr :diffget //3 \| diffupdate<CR>

"" ========== NvimMiniyank ==========
if has("nvim")
  map p <Plug>(miniyank-autoput)| map P <Plug>(miniyank-autoPut)
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
