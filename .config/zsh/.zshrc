# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history
HIST_STAMPS="yyyy-mm-dd"

source $ZDOTDIR/aliases
source $ZDOTDIR/functions

export ZSH="$ZDOTDIR/oh-my-zsh"
source $ZSH/oh-my-zsh.sh
plugins=(git)
zstyle ':omz:update' mode auto      
zstyle ':omz:update' frequency 14

# zplug 
export ZPLUG_HOME="$ZDOTDIR/zplug"
source $ZPLUG_HOME/init.zsh
# Install Zplug
if [[ ! -d $ZDOTDIR/zplug ]]; then
  git clone https://github.com/zplug/zplug $ZDOTDIR/zplug
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

# Plugin List
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-completions"
zplug "rupa/z"
zplug "changyuheng/fz.sh"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# Install new plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    else
      echo
    fi
fi

zplug load

eval "$(starship init zsh)"


# Aliases:
#alias fucking="sudo"
#alias dev="adb connect 192.168.1.36:5555 && scrcpy"
#alias dev2="adb connect 192.168.1.43:5555 && scrcpy"
#alias fuck="sudo apt update && sudo apt upgrade"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"