########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# vim:set ft=zsh:

########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# プロンプト
# cf. https://www.slideshare.net/tetutaro/zsh-20923001
# %B...%b     : %Bと%bの間を太字にする
# %F{color}%f : %Fと%fの間の文字ををcolorにする
# %K{color}%k : %Kと%kの間の背景色をcolorにする
# %C          : カレントディレクトリ
# %~          : カレントディクトリ(ホームディレクトリ以下全て表示)
# %n          : ユーザー名
# %m          : ホスト名
local p_dir="%F{yellow}[@%~]%f"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
# 1行表示
#PROMPT="$p_dir $p_mark "
# 2行表示
# 改行のパラメータWAKARANEEEEE
#PROMPT="$p_dir
#$p_mark "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# オプション

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
#bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

#lsコマンドをglsコマンドに置き換え
alias ls='gls --color=auto'

# Emacs
alias e='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias ee='/Applications/Emacs.app/Contents/MacOS/Emacs'

# VS Code
alias vsc='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# ssh
alias ssh_s15ti032='ssh s15ti032@zenith.edu.ics.saitama-u.ac.jp'

# tmux
alias tk='tmux kill-session'

# git
alias gs='git status'
alias gp='git push'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
export LESS='-M -R'
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

########################################
# cdの後にlsを実行
chpwd() { ls -a --color=auto }

#fgとbgを完全に無視したC-p
#https://qiita.com/aosho235/items/83e338989b901b99fe35
_up-line-or-history-ignoring() {
    zle up-line-or-history
    case "$BUFFER" in
        fg|bg)
            zle up-line-or-history
            ;;
    esac
}
zle -N _up-line-or-history-ignoring
bindkey '^P' _up-line-or-history-ignoring

#同様にfgとbgを完全に無視したC-n
_down-line-or-history-ignoring() {
    zle down-line-or-history
    case "$BUFFER" in
        fg|bg)
            zle down-line-or-history
            ;;
    esac
}
zle -N _down-line-or-history-ignoring
bindkey '^N' _down-line-or-history-ignoring

# コマンド履歴でpecoる
# https://qiita.com/tmsanrinsha/items/72cebab6cd448704e366
function peco-select-history() {
    # historyを番号なし、逆順、最初から表示。
    # 順番を保持して重複を削除。
    # カーソルの左側の文字列をクエリにしてpecoを起動
    # \nを改行に変換
    BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
    CURSOR=$#BUFFER             # カーソルを文末に移動
    zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

# Powerline
powerline-daemon -q
. $HOME/.pyenv/versions/3.6.4/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

########################################
#PATH

# Disable Loading Global Profiles
setopt no_global_rcs

## 重複パスを登録しない
typeset -U path cdpath fpath manpath

#ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Mecab
export PATH="/usr/local/mecab/bin:$PATH"

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

# stack(Haskell)
export PATH="$HOME/.local/bin:$PATH"

# Apache Portable Runtime
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/apr-util/bin:$PATH"
