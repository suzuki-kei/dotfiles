
declare -r ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
declare -r DOTFILES_DIR="${ROOT_DIR}/dotfiles"

declare -r BASHRC_FILE="${DOTFILES_DIR}/.bashrc"
if [[ "$(grep -F "source '${BASHRC_FILE}'" ~/.bashrc)" != "source '${BASHRC_FILE}'" ]]; then
    sed -ie "\$a source '${DOTFILES_DIR}/.bashrc'" ~/.bashrc
fi

install -DTm 644 {"${DOTFILES_DIR}",~}/.gitconfig
install -DTm 644 {"${DOTFILES_DIR}",~}/.screenrc
install -DTm 644 {"${DOTFILES_DIR}",~}/.vimrc
install -DTm 644 {"${DOTFILES_DIR}",~}/.docker/config.json

