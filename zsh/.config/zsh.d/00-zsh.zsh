
alias ls="ls --color=auto"

autoload -U compinit colors
compinit; colors
zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}(%{$fg[green]%}%s %{$fg[blue]%}%r%{$fg[cyan]%}:%{$fg[green]%}%b%{$fg[yellow]%}%m%u%c%{$fg[cyan]%})%{$reset_color%} "

setopt prompt_subst
export PROMPT="%{$fg_bold[red]%}%n%{$reset_color$fg[white]%}@%{$fg_bold[green]%}%m%{$reset_color$fg[white]%}:%{$fg[cyan]%}%1~ \${vcs_info_msg_0_}%{$fg_bold[white]%}%(#.#.\$) %{$reset_color%}"
export RPROMPT=""

function precmd {
        vcs_info
        print -Pn "\e]0;[%~]\a"
}
function preexec {
        if [ "$1" = "fg" ]; then
                cmdline="$(jobs | awk '{if ($2=="+") {$1=$2=$3=""; print $0}}')"
        elif [ "$(echo "$1" | awk '{print $1}')" = "fg" ]; then
                cmdline="fg"
        else
                cmdline="$1"
        fi
        print -Pn "\e]0;[%~] $cmdline\a"
}

function mkcd {
    mkdir -p "$1"
    cd "$1"
}
