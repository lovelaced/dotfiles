source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U compinit promptinit colors
compinit
promptinit
colors

export TERM=xterm-256color
export BROWSER=firefox
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

PROMPT="
%{$fg[lightgreen]%} »  %{$reset_color%}"
#PROMPT="
#%{$fg[red]%} >  %{$reset_color%}"
RPROMPT="%B%{$fg[gray]%}%~%{$reset_color%}"

[[ -t 1 ]] || return
case $TERM in
	*xterm*|*rxvt*|(dt|k|E|a)term)
		preexec () {
			print -Pn "\e]2;$1\a"    # edited; %n@%m omitted, as I know who and where I am
		}
		;;
esac

setopt AUTO_CD
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="${HOME}"/.zsh-history
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey "^j" history-beginning-search-backward
bindkey "^k" history-beginning-search-forward

function fname() { find . -iname "*$@*"; }
function steam() { docker run -ti --privileged --name=steam \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
-v /dev/dri:/dev/dri \
-e DISPLAY=${DISPLAY} tianon/steam /bin/bash}
		    
conf() {
	case $1 in
		bspwm)		vim ~/.config/bspwm/bspwmrc ;;
		sxhkd)		vim ~/.config/sxhkd/sxhkdrc ;;
		mpd)		vim ~/.mpdconf ;;
		ncmpcpp)	vim ~/.ncmpcpp/config ;;
		pacman)		svim /etc/pacman.conf ;;
		tmux)		vim ~/.tmux.conf ;;
		vim)		vim ~/.vimrc ;;
		xinit)		vim ~/.xinitrc ;;
		xresources)	vim ~/.Xresources && xrdb ~/.Xresources ;;
		zathura)	vim ~/.config/zathura/zathurarc ;;
		zsh)		vim ~/.zshrc && source ~/.zshrc ;;
		hosts)		sudoedit /etc/hosts ;;
		vhosts)		sudoedit /etc/httpd/conf/extra/httpd-vhosts.conf ;;
		httpd)		sudoedit /etc/httpd/conf/httpd.conf ;;
		*)			echo "Unknown application: $1" ;;
	esac
}

function music()
{
	sudo mount /dev/sda1/ ~/mount/
	sleep 1
	sudo mpd
	sleep 0.5
	mpdscribble
	sleep 3
	ncmpcpp
}


function sd()
{
	sudo mount /dev/mmcblk0p1 /mnt
	cd /mnt/DCIM
	ls
}


# Sudo alias 
alias pacman='sudo pacman'

# Programs
alias installfont='sudo fc-cache -f -v'
alias alsamixer="alsamixer -g"
alias equalizer="alsamixer -D equal"
alias toi="toilet --font mono12 --filter metal"
alias wifis='wpa_cli status -i wlp3s0'
alias scan='wpa_cli scan'
alias sresults='wpa_cli scan_results'
alias networks='wpa_cli list_networks'
alias vim='nvim'

# Shortcuts
alias c='xsel -ib'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias l='ls -lahtr'
alias vi='vim'
alias bat='acpi -V | grep Battery'
alias sleep='sudo systemctl hibernate'
alias record='arecord -f cd -t raw | oggenc - -r -o out.ogg'
alias neuro='ssh neuro@localhost -p 10002'
alias tunnel='sudo systemctl start sshd && autossh -M 20000 -f -N valka@cyberpunk.party -R 10002:localhost:22 -C'

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

set -o noclobber
set -o vi


# MUTT BG fix
COLORFGBG="default;default"

pathdirs=(
    $HOME/scripts
)
for dir in $pathdirs; do
    if [ -d $dir ]; then
        path+=$dir
    fi
done

export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$PATH:$HOME/bin
export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=true' 
export JAVA_FONTS=/usr/share/fonts/TTF

#extract anything
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#color man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}


unset XDG_CONFIG_HOME
