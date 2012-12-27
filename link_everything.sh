#! /bin/bash

targets=( ".screenrc" "scripts" ".vim" ".vimrc" ".xmonad" ".zshrc" )
for target in "${targets[@]}"
do
	if [ -e $target ]; then
		echo "Removing $target"
		rm -fR ~/$target
	fi
	echo "Creating symlink for $target"
	ln -s `pwd`/$target  ~/
done
