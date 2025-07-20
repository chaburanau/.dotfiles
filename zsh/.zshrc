export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

plugins=(
	git
	ubuntu
	systemd
	golang
	docker
	docker-compose
	copybuffer
	archlinux
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias e='nvim'

export LANG=en_US.UTF-8
export EDITOR='nvim'

export PATH=$PATH:/usr/local/go/bin:$HOME/.golang/bin
export GOPATH=$HOME/.golang

