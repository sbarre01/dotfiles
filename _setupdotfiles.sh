export SHELLSCONFIGDIR=.dotfiles

pushd ~

# Unlink existing
.bash_history
.bash_profile
.bashrc
.conf
.gitconfig
.gitignore
.netrc
.profile
.rvmrc
.shellaliases
.shellactivities
.shellpaths
.shellvars
.vimrc

# Link
.bash_history
.bash_profile
.bashrc
.conf
.gitconfig
.gitignore
.netrc
.profile
.rvmrc
.shellactivities
.shellaliases
.shellpaths
.shellvars
.vimrc


# Cleanup
rm .zsh_history && ln -s $SHELLSCONFIGDIR/.zsh_history

popd

