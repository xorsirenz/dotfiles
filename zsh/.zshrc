export SHELL=/bin/zsh
export EDITOR=vim
#enable colors and change prompt
autoload -U colors && colors
PS1="[%n:%F{cyan}%~%f]$ "

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# language
export LANG=en_US.UTF-8

# don't throw errors when file gobs don't match anything
setopt NULL_GLOB
setopt NO_NULL_GLOB
setopt NOMATCH
setopt NO_NOMATCH
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE

# extended globbing
setopt EXTENDED_GLOB
setopt NO_EXTENDED_GLOB

# turn off beep
unsetopt beep

# custom aliases
source $HOME/.aliases

# vi mode
bindkey -v
bindkey -e
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/madison/.zshrc'

# auto complete
autoload -Uz compinit && compinit

# the gits
autoload -Uz add-zsh-hook vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
# add red indicator to prompt
RPROMPT='%F{#ec95ec}${vcs_info_msg_0_}%f'
zstyle ':vcs_info:git:*' formats '%b'
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# case insensitive path-completion 
zstyle ':completion:*' matcher-list  'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# loading plugins - keep at end of file.
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
