# vim環境構築

## Base
install: Homebrew  
plugin-manager: dein.vim  
color-scheme: hybrid  

#### ruby/rails
rubocop  
solargraph

### vimのインストール
% brew install vim  
% export PATH="/usr/local/bin:$PATH"

### rubyのGem導入
% gem install rubocop  

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

### ctagsの導入（不完全のため、要確認）
% brew install ctags  
% alias ctags="`brew --prefix`/bin/ctags"  
// 確認  
% ctags -R

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

##  fzf(曖昧検索)の導入
```
% brew install fzf
% brew install ripgrep
```

// zshrcに追記
# Settings for fzf
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Language Serverの導入
入力補完と適宜元ジャンプ
* coc.nvimを導入
前提として、Node.jsが必要
今回はrubyを補完して欲しいので、solargraphを使う
```
:CocInstall coc-solargraph
```
を実行することで使用可能になる
install先は`/.config/coc/extensions/`になる
