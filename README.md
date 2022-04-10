# dotfiles
dotarile backup

### backup コマンド
mv ~/.bashrc backup
ln -s ~/backup/.zshrc ~

管理したいファイルをbackupディレクトリに移動
```
% mv [ファイル名] ~/backup/[保存先]

# 例:
% mv ~/.bashrc backup
```

移動させたファイルにシンボリックリンクを貼る
```
% ln -s ~/backup//[保存先] [元々あった場所]

# 例:
ln -s ~/backup/.zshrc ~
```

