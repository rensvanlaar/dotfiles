HOST_NAME=Rensy

source ~/.nvm/nvm.sh
nvm use stable
shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("🎲" "👽" "🍑" "💩" "🐵" "👀" "💀")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $bldgrn%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

fortune | cowsay -f tux | lolcat

function mkcd()
{
	mkdir $1 && cd $1
}

# --------
# Aliases
# --------
alias l="ls" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias cl="clear" # Clears terminal
alias o="open ." # Open the current directory in Finder
alias cdd="/Users/rensvanlaar/Library/Mobile\ Documents/com~apple~CloudDocs/dev" # cd into dev folder

# ------------
# Git Aliases
# ------------
alias dfgit='git --git-dir=/Users/rensvanlaar/.dotfiles/ --work-tree=/Users/rensvanlaar'



[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
