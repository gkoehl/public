#!/usr/bin/env bash -xe

set -o pipefail

################################################################################
# ROOT
################################################################################
FS_PATH="${1}"
if [[ -z ${FS_PATH} ]]; then
    FS_PATH="${HOME}/fs"
fi

################################################################################
# STRUCTURE
################################################################################
readonly FS___PATH="${FS_PATH}/_"
readonly FS____PATH="${FS_PATH}/__"
readonly FS_BIN_PATH="${FS_PATH}/bin"
readonly FS_DOCS_PATH="${FS_PATH}/docs"
readonly FS_REPOS_PATH="${FS_PATH}/repos"
readonly FS_SCRIPTS_PATH="${FS_PATH}/scripts"
readonly FS_SHELLS_PATH="${FS_PATH}/shells"

mkdir -pv "${FS_PATH}"
mkdir -pv "${FS___PATH}"
mkdir -pv "${FS____PATH}"
mkdir -pv "${FS_BIN_PATH}"
mkdir -pv "${FS_DOCS_PATH}"
mkdir -pv "${FS_REPOS_PATH}"
mkdir -pv "${FS_SCRIPTS_PATH}"
mkdir -pv "${FS_SHELLS_PATH}"

################################################################################
# SHELLS : ZSH
################################################################################
if [[ ! -n $(which zsh) ]]; then
    exit 0
fi

readonly HOME_ZSHRC_PATH="${HOME}/.zshrc"
readonly FS_SHELLS_ZSH_PATH="${FS_SHELLS_PATH}/zsh"

if [[ ! -f ${HOME_ZSHRC_PATH} ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if [[ ! -d "${FS_SHELLS_ZSH_PATH}" ]]; then
    git clone https://github.com/gkoehl/zsh.git ${FS_SHELLS_ZSH_PATH}
fi
if [[ -d "${FS_SHELLS_ZSH_PATH}" && -f ${HOME_ZSHRC_PATH} ]]; then
    sed -E -i.old 's~^(#*).*([[:blank:]]*ZSH_CUSTOM[[:blank:]]*=[[:blank:]]*).*~\2'"${FS_SHELLS_ZSH_PATH}"'~' "${HOME_ZSHRC_PATH}"
    # zsh
    # chsh -s $(which zsh)
    # source "${HOME_ZSHRC_PATH}"
fi

################################################################################
# EXIT
################################################################################
exit 0
