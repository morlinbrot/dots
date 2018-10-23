" Set the runtime to the default vim path to use the same plugins.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" Use a shared vimrc from my configs repo.
source ~/configs/.vimrc
" Use a specific nvimrc from my configs repo.
source ~/configs/.nvimrc
