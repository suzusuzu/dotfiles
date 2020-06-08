export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

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
