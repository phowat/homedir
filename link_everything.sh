#! /bin/bash

targets=( ".screenrc" "scripts" ".vim" ".vimrc" ".xmonad" ".zshrc" ".tmux.conf" )
for target in "${targets[@]}"
do
	if [ -e ~/$target -a "$1" = "-f" ]; then
		echo "Removing $target"
		rm -fR ~/$target
	elif [ -e ~/$target ]; then
		echo "File $target exists, not linking."
		continue
	fi
	echo "Creating symlink for $target"
	ln -s `pwd`/$target  ~/
done
