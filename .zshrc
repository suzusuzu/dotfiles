export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=1000000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection


autoload -Uz compinit && compinit -i

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"

zplug "plugins/git", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"

zplug "mafredri/zsh-async", from:github

zplug "zsh-users/zsh-syntax-highlighting"

zplug "zsh-users/zsh-history-substring-search"

zplug romkatv/powerlevel10k, as:theme, depth:1

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


zplug load --verbose

