#!/bin/bash -xe

set -o pipefail

################################################################################
# CLI
################################################################################
# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${VERSION_AWS_CLI}.zip" -o "awscliv2.zip" \
#   && ls -lh awscliv2.zip \
#   && unzip awscliv2.zip \
#   && ./aws/install \
#   && aws --version
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

# asdf plugin add python
# asdf install python latest
# pip install --upgrade pip
# pip install pipenv

# git clone <repo>
# cd <repo>
# asdf install
# pipenv install -e .
# pipenv run <package>
# cd ${OLDPWD}

################################################################################
# EXIT
################################################################################
exit 0