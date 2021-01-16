#!/bin/bash -xe

set -o pipefail

################################################################################
# PREFERENCES
################################################################################
# # CONFIGURE
# # CONFIGURE: OS
# defaults -currentHost write com.apple.finder AppleShowAllFiles YES
# defaults -currentHost write com.apple.finder CreateDesktop -bool false
# defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
# defaults -currentHost write com.apple.dock autohide -bool true
# defaults -currentHost write -g InitialKeyRepeat -int 15
# defaults -currentHost write -g KeyRepeat -int 2
# # defaults -currentHost write -g com.apple.swipescrolldirection -bool false
# # TODO: Add in show in titlebar
# # TODO: Set alert volume
# killall Dock
# killall Finder
# # CONFIGURE: GIT
# git config --global credential.helper cache
# git config --global user.name ""
# git config --global user.email ""

# chflags nohidden ~/Library
# # Show hidden files:
# defaults write com.apple.finder AppleShowAllFiles YES
# # Show path bar:
# defaults write com.apple.finder ShowPathbar -bool true
# # Show status bar:
# defaults write com.apple.finder ShowStatusBar -bool true
# # Go to System Preferences for the following:
# # Keyboard > Text > Disable “Correct spelling automatically”
# # Security and Privacy > Firewall > On
# # Security and Privacy > General > Allow App Store and identified developers
# # File Sharing > Off

################################################################################
# MANAGERS: PACKAGES
################################################################################
if [[ ! -n $(which brew) ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

PACKAGES_BREW=(
  $(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/packages/brew.json | jq -r ".default | @sh")
)
brew install \
    "${PACKAGES_BREW[@]}"

################################################################################
# MANAGERS: VERSIONS
################################################################################
if [[ ! -n $(which asdf) ]]; then
  git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf
  cd ${HOME}/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"
  cd ${OLDPWD}
fi

################################################################################
# EXIT
################################################################################
exit 0