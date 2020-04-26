" Set the runtime to the default vim path to use the same plugins.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" Use this repo's .vimrc file.
source ~/dotfiles/.vimrc
