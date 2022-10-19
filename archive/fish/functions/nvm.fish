# Source nvm setup script
# https://github.com/nvm-sh/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file-1
function nvm 
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
