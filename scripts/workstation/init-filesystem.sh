#!/usr/bin/env bash -xe

set -o pipefail

################################################################################
# SHELLS
################################################################################
readonly SHELLS_PATH="${HOME}/Shells"

mkdir -pv "${SHELLS_PATH}"

################################################################################
# SHELLS : ZSH
################################################################################
if [[ -x $(which zsh) ]]; then
    readonly SHELLS_ZSH_ZSHRC_PATH="${HOME}/.zshrc"
    readonly SHELLS_ZSH_PATH="${SHELLS_PATH}/zsh"

    if [[ ! -f ${SHELLS_ZSH_ZSHRC_PATH} ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    if [[ ! -d "${SHELLS_ZSH_PATH}" ]]; then
        git clone https://github.com/gkoehl/zsh.git ${SHELLS_ZSH_PATH}
    fi
    if [[ -d "${SHELLS_ZSH_PATH}" && -f ${SHELLS_ZSH_ZSHRC_PATH} ]]; then
        sed -E -i.old 's~^(#*).*([[:blank:]]*ZSH_CUSTOM[[:blank:]]*=[[:blank:]]*).*~\2'"${SHELLS_ZSH_PATH}"'~' "${SHELLS_ZSH_ZSHRC_PATH}"
        # sed -i 's/_THEME=\"robbyrussel\"/_THEME=\"linuxonly\"/g' ${SHELLS_ZSH_ZSHRC_PATH}
        # zsh
        # chsh -s $(which zsh)
        # source "${SHELLS_ZSH_ZSHRC_PATH}"
    fi
fi

################################################################################
# FS: GKFS
################################################################################
readonly GKFS_NAME="gkfs"
readonly GKFS_PATH="${HOME}/.${GKFS_NAME}"

if [[ ! -x $(which gkfs) ]]; then
    git clone https://github.com/gkoehl/gkfs.git ${GKFS_PATH}
    # # NOTE: add if using tags for versioning
    # cd ${GKFS_PATH}
    # git checkout "$(git describe --abbrev=0 --tags)"
    # cd ${OLDPWD}

    # # NOTE: add to .zshrc or custom.zsh
    # . ${HOME}/.${GKFS_NAME}/${GKFS_NAME}.sh
    # fpath=(${GKFS_PATH}/completions ${fpath})
    # autoload -Uz compinit
    # compinit
fi

################################################################################
# EXIT
################################################################################
exit 0
