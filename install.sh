#!/bin/bash
echo Installing dotfiles
for i in .bashrc .bash_profile .bash_prompt .functions .aliases .exports .vim .vimrc
do
	if [ -f ~/$i ]; then
		rm ~/$i
	fi
	ln -sf ~/dotfiles/$i ~
done
