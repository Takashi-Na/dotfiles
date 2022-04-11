# 目的
主要なdotfileをgitで管理するようにする

# directory
~/dotfiles

# 管理方法
管理したいファイルを`~/dotfiles`下に移動させる
本来ファイルがあった場所にはシンボリックリンクを貼る

具体的なコマンド例
```
$ mv ~/.vimrc ~/dotfiles/
$ ln -s ~/dotfiles/.vimrc ~/.vimrc
```

# 可能なら行うこと
dotfilesにはinstall.shなどの名前で、  
シンボリックリンク作成やパッケージインストールのコマンドをまとめたシェルスクリプトを  
用意しておくことが多いらしい。  
dotfilesをgit cloneしてinstall.shを実行するだけで環境設定が終わればpcが変わっても便利
