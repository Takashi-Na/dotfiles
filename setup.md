# mac環境構築

## 環境概要
Homebrew
iTerm2  
zsh  
font: Ricty  


### iTerm
color-scheme:hybrid
font:Ricty
を採用

* hybridを導入
下記にcolorschemeがまとまっているのでダウンロードしてくる
https://github.com/mbadolato/iTerm2-Color-Schemes
好みのテーマを選び、(schems/[テーマ名].itermcolorsから適当に)
iTermの設定(Preferences/Profile/Colors)からインポートする

* Rictyを導入
```
% brew tap sanemat/font
% brew install ricty
% cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
% fc-cache -vf
```

### Homebrewのインストール
homeディレクトリで行う
```
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/% install/master/install.sh)"
```

### zshをデフォルトに設定
Homebrewからzshをインストール
```
% brew install zsh
% brew install zsh-completions
```
Homebrewのzshを使うように設定
```
% sudo vi /etc/shells
```
下記を追記
> /usr/local/bin/zsh
```
chsh -s /usr/local/bin/zsh
```
再起動して確認
```
echo $SHELL
/usr/local/bin/zsh
```

## Ruby
rbenvとruby-buildのインストール
```
% brew install rbenv ruby-build
```

rbenvをどこからでも使えるようにする
```
% echo 'eval "$(rbenv init -)"' >> ~/.zshrc
% source ~/.zshrc
```

* readlineのインストール
```
% brew install readline
```

readlineをどこからでも使えるようにする
```
% brew link readline --force
```

## node
* nodebrewnのインストール
```
% brew install nodebrew
```

安定版をインストール
```
% nodebrew install-binary stable
```

nodeの有効化
```
% nodebrew use v16.13.2
```

pathを通す
```
% echo '' >> ~/.zprofile
% source ~/.zshrc
```

## MySQL
MySQL@5.6をインストール
```
% brew install mysql@5.6
```

MySQL自動起動設定(やらない方が良い)
```
% mkdir ~/Library/LaunchAgents 
% ln -sfv /usr/local/opt/mysql\@5.6/*.plist ~/Library/LaunchAgents
% launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql\@5.6.plist
```

MySQLをどこからでも使えるようにする
```
% echo 'export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"' >> ~/.zshrc
% source ~/.zshrc
```

## shared-mime-info
shared-mime-infoをインストール
```
% brew install shared-mime-info
```

## Rails
bundlerをインストール
```
% gem install bundler --version='2.1.4'
```

Railsをインストール
```
% gem install rails --version='6.0.0'
```

rbenvを再読み込み
```
% rbenv rehash
```

Gemのインストール
```
% gem install rubocop
% gen install solargraph
```

# Node.js
Node.jsのインストール
```
% brew install node@14
```

Node.jsにパスを設定
```
% echo 'export PATH="/usr/local/opt/node@14/bin:$PATH"' >> ~/.zshrc
% source ~/.zshrc
```

## yarn
yarnのインストール
```
% brew install yarn
```

# SOBA
```
brew install node
brew install mysql
brew install nginx
brew install mongodb
brew install redis
```

# zsh compinit: insecure directories
```
% chmod 755 /usr/local/share/zsh/site-functions
% chmod 755 /usr/local/share/zsh
```

# インストールアプリ一覧
・基幹系  
GoogleChome  
Magnet  
Clipy  
Gyazo  
GyazoGif  
Slack  
Office系  
ZOOM  

・開発系  
VSCode  
  拡張機能一覧  
  ・zenkaku  
  ・ruby  

GithubDesktop  
SequelPro  
Docker Desktop  
DiffMerge  
