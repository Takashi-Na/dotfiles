set encoding=utf-8
set backspace=indent,eol,start
" tabのスペースの数
set tabstop=2
set shiftwidth=2
" 行数表示
set number
" 行末にスペース
set virtualedit=onemore
" カラースキーム
set background=dark
colorscheme hybrid
" yankをclipboardと繋ぐ
set clipboard=unnamed
" swpfileの保存先を変更
set noswapfile
" 編集中のタイトル表示
set title
" 検索文字ハイライト
set hlsearch
" xで消した時はyankに残さない
vnoremap x "_x
nnoremap x "_x

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" クオーテーションの補完
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

" insertモードでemacsのキーバインドを使えるようにする
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" プラグインがインストールされるディレクトリ
 let s:dein_dir = expand('~/.vim/dein')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir=expand('~/.dein/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein-lazy.toml'

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})


	" plugin========================================================
	call dein#add('Shougo/neocomplcache.vim')

	" ruby-----------------------------------------------------------
	" rsenseの導入
	call dein#add('Shougo/neocomplcache-rsense.vim')
	" config
	if !exists('g:neocomplcache_omni_patterns')
  	let g:neocomplcache_omni_patterns = {}
	endif
	let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
	"rsense_path
	let g:rsenseHome = expand('/Users/naoki/.rbenv/shims/rsense')
	let g:rsenseUseOmniFunc = 1

	" rubocopの導入
	call dein#add('w0rp/ale')
	let g:ale_fixers = {
	\   'ruby': ['rubocop'],
	\}
  call dein#end()
  call dein#save_state()
endif

" インストールしていないプラグインがあればインストールを実行
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on

"End dein Scripts-------------------------

