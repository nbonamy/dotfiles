#!/bin/bash

for i in .bashrc .bash_profile .bash_prompt .functions .aliases .exports .vim .vimrc
do
	rm ~/$i
	ln -s ~/dotfiles/$i ~
done
