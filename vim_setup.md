# vim環境構築

## Base
install: Homebrew  
plugin-manager: dein.vim  
color-scheme: hybrid  

## Plugin
// 定義元へ飛ぶ  
ctags(未完成)  

#### ruby/rails
rubocop  
refe2  
// 自動コード補完  
RSense  

### vimのインストール
% brew install vim  
% export PATH="/usr/local/bin:$PATH"


### rubyのGem導入
% gem install rsense  
% gem install rubocop  
% gem install  refe2

### リファレンス事前準備
% bitclust setup

### dein.vimの導入
% mkdir ~/.vim/dein  
% cd ~/.vim/dein  
% curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh  
% sh ./installer.sh ~/.vim/dein  

// コピーして`~/.vimrc`に貼り付け

```
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/naoki/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/naoki/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/naoki/.vim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
```

% vim ~/.vimrc


### rubocopとrefe2の導入
% gem install rubocop refe2

// rubocopとrefe2が表示されればOK  
% gem list | grep -e rubocop -e refe2

// リファレンスの構築  
% bitclust setup


### ctagsの導入（不完全のため、要確認）
% brew install ctags  
% alias ctags="`brew --prefix`/bin/ctags"  
// 確認  
% ctags -R


### Rsense(rsense/rsense)の導入
% gem install rsense  
% which rsense  
// pathをコピーして.vimrcに下記を貼り付け  

```
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplcache-rsense.vim')
```

```
let g:rsenseHome = expand("*Rsense InstallPath")
let g:rsenseUseOmniFunc = 1
```

## color-scheme(hybridを採用)
hybridをinstall
```
% mkdir ~/.vim/colors
% cd ~/.vim
% clone https://github.com/w0ng/vim-hybrid
% mv vim-hybrid/colors/hybrid.vim ~/.vim/colors
```
.vimrcにカラースキームを設定
```
% vim ~/.vimrc
```
下記を追記
> set background=dark
> colorscheme hybrid
