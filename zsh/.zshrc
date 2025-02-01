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

export LANG=en_US.UTF-8
export EDITOR='nvim'

export PATH=$PATH:/usr/local/go/bin:$HOME/work/golang/bin
export GOPATH=$HOME/work/golang

alias e='nvim'
