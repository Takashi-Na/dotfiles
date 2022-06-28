##############################
# zsh config
##############################
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# 直前のコマンドの重複を削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

# colorschemeを適応
export CLICOLOR=1
export TERM=xterm-256color

# Settings for fzf
export PATH="$PATH:$HOME/.fzf/bin"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 30% --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##############################
# path
##############################
# anyenv
# todo:なぜか2回記述しないと読み込んでくれない
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# pathの重複をsource zshrc時に削除
typeset -U PATH

##############################
# env
##############################
# # basic認証
export BASIC_AUTH_USER='admin'
export BASIC_AUTH_PASSWORD='3333'

# payJPのテストキー
export PAYJP_SECRET_KEY='sk_test_785e9814c7a62311027b0c18'
export PAYJP_PUBLIC_KEY='pk_test_1a53bbbec9523a108e9518d6'

##############################
# alias
##############################
alias zshrc="vi ~/.zshrc"
alias source_zshrc="source ~/.zshrc"
alias ssh_config="vi ~/.ssh/config"
alias vimrc="vi ~/.vimrc"
alias dein.toml="vi ~/.dein/dein.toml"
alias dein-lazy.toml="vi ~/.dein/dein-lazy.toml"

# projects
alias remote_asisst="cd ~/SOBA/projects/remote_assist"
alias spot="cd ~/SOBA/projects/spot"
alias mieruka_cloud="cd ~/SOBA/projects/mieruka_cloud"
alias broadtalk="cd ~/SOBA/projects/broadtalk"
alias yashima="cd ~/SOBA/projects/yashima"
alias knowledge.wiki="cd ~/SOBA/projects/knowledge.wiki"
alias docker_database="cd ~/SOBA/projects/docker_database"

##############################
# SOBA
##############################
# docker_databaseの保存先
export DB_BASE_PATH='~/tmp'

# yashima
export LMS_DB_USER='root'
export LMS_DB_PASS='pass'
export LMS_DB_HOST='127.0.0.1'
export LMS_LATTE_HOST='local-latte.soba-project.com'

# remote_asisst
export COCOA_DB_HOST='127.0.0.1'

