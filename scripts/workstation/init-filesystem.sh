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

# ################################################################################
# # FS: GKS
# ################################################################################
# readonly GKS_NAME="gks"
# readonly GKS_PATH="${HOME}/.${GKS_NAME}"

# if [[ ! -x $(which gks) ]]; then
#     git clone git@github.com-github_gkoehl2:gkoehl2/gks.git ${GKS_PATH}
#     # # NOTE: add if using tags for versioning
#     # cd ${GKS_PATH}
#     # git checkout "$(git describe --abbrev=0 --tags)"
#     # cd ${OLDPWD}

#     # # NOTE: add to .zshrc or custom.zsh
#     # . ${HOME}/.${GKS_NAME}/${GKS_NAME}.sh
#     # fpath=(${GKS_PATH}/completions ${fpath})
#     # autoload -Uz compinit
#     # compinit
# fi

################################################################################
# EXIT
################################################################################
exit 0
