#!/bin/bash -xe

set -o pipefail

################################################################################
# PREFERENCES
################################################################################

################################################################################
# MANAGERS: PACKAGES
################################################################################
PACKAGES_APT_GET=(
  $(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/packages/apt-get.json | jq -r ".default | @sh" | tr -d \')
)
apt-get update \
  && apt-get install -y \
  "${PACKAGES_APT_GET[@]}"

################################################################################
# MANAGERS: VERSIONS
################################################################################
if [[ ! -n $(which asdf) ]]; then
  git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
  cd ${HOME}/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  cd ${OLDPWD}
fi

# apt-get update \
#   && apt-get install -y --no-install-recommends \
#   && rm -rf /var/lib/apt/lists/*

################################################################################
# EXIT
################################################################################
exit 0