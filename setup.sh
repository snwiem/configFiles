#!/usr/bin/env bash
# simple script to setup all my local config files for my commonly used
# tools
# this is currently not very generic and can be improved


# TODO: add powerline configuration

function install_conky {
	TFILE=$HOME/.config/.conkyrc
	if [ -f "$1/conky/conkyrc" ]; then
		echo "Installing conky configuration"
		ln -sf "$1/conky/conkyrc" $TFILE
	else
		echo "No conky configuration found"
	fi
}

function install_i3 {
	TDIR=$HOME/.config/i3
	if [ -d "$1/i3" ]; then
		echo "Installing i3 resources"
		mkdir -p $TDIR
		ln -fs $1/i3/* $TDIR/
	else
		echo "No i3 resources found"
	fi
}

function install_xresources {
	TDIR=$HOME
	if [ -f "$1/.Xresources" ]; then
		echo "Installing Xresource file"
		ln -fs "$1/.Xresources" $TDIR/
	else
		echo "No Xresource file found"
	fi
}

function install_vim {
	if [ -f "$1/vim/vimrc" ]; then
		TFILE="$HOME/.vimrc"
		echo "Installing vimrc"
		ln -s "$1/vim/vimrc" $TFILE
	else
		echo "No vimrc found"
	fi
	if [ -f "$1/vim/gvimrc" ]; then
		TFILE="$HOME/.gvimrc"
		echo "Installing gvimrc"
		ln -s "$1/vim/gvimrc" $TFILE
	else
		echo "No gvimrc found"
	fi
}

function install_bash {
	echo "Nothing to do for bash right now"
}

function install_zsh {
	if [ -f "$1/zsh/zshrc" ]; then
		TFILE="$HOME/.zshrc"
		echo "Installing zshrc"
		ln -s "$1/zsh/zshrc" $TFILE
	else
		echo "No zshrc found"
	fi
}

function install_all {
	CDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	
	install_i3 $CDIR
	install_zsh $CDIR
	install_xresources $CDIR
	install_vim $CDIR
}


install_all
