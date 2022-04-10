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

" dotfileの管理をする場合はこれを有効にする
" プラグインがインストールされるディレクトリ
" let s:dein_dir = expand('~/.vim/dein')

" Required:
set runtimepath+=/Users/naoki/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/naoki/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/naoki/.vim/dein/repos/github.com/Shougo/dein.vim')

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
" ---------------------------------------------------------------

" directoryのツリー表示
call dein#add('scrooloose/nerdtree')
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" indentの表示
call dein#add ('nathanaelkane/vim-indent-guides')
let g:indent_guides_enable_on_vim_startup = 1

" 簡易コメントアウト
call dein#add ('tomtom/tcomment_vim')
vnoremap ? :'<,'>TComment<CR>
" Required:
" ==============================================================
call dein#end()

" Required:
filetype plugin indent on
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------

