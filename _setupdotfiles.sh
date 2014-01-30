export SHELLSCONFIGDIR=~/dotfiles

pushd ~

DOTFILES=".bash_history .bash_profile .bashrc .gitconfig .gitignore .netrc .profile .vimrc"
DOTDIRS=".vim"

if [ -d ~/.old ]; then
	echo "~/.old already exists! Please clean up and try again."
	exit 1
fi

mkdir ~/.old

for dotfile in $DOTFILES; do
	filename=~/$dotfile
	if [ -f $filename ]; then
		echo "Found existing dotfile $filename!"
		echo "mv $filename ~/.old/"
	fi
	sourcefile=$(echo $dotfile | sed 's/^\.//')
	echo "ln -s $SHELLSCONFIGDIR/$sourcefile ~/"
done

for dotdir in $DOTDIRS; do
	dirname=~/$dotdir
	if [ -d $dirname ]; then
		echo "Found existing directory $dirname!"
		echo "mv $dirname ~/.old/"
	fi
	sourcedir=$(echo $dotdir | sed 's/^\.//')
	echo "ln -s $SHELLSCONFIGDIR/$sourcedir ~/"
done


# Cleanup
#rm .zsh_history && ln -s $SHELLSCONFIGDIR/.zsh_history

popd

