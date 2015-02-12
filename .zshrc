# Set up the prompt

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macosx'
fi

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

if [[ $platform == 'macosx' ]]; then
	export CLICOLOR=YES
fi 

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if [[ $platform == 'linux' ]]; then
	eval "$(dircolors -b)"
fi 
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH="$PATH":/home/pedro/Code/depot_tools:/home/pedro/scripts

if [ -e "~/perl5/perlbrew/etc/bashrc" ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi

if [ -e "~/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
	source ~/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -e "~/Code/zsh-output-highlighting/zsh-output-highlighting.zsh" ]; then
	source ~/Code/zsh-output-highlighting/zsh-output-highlighting.zsh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:~/bin:~/nim-0.10.2/bin:$PATH"
alias ivssh="ssh -p 2222 -i ~/.ssh/id_rsa.iv"
export svn=http://svn.instant.intranet/svn/instantvoice
