#!/usr/bin/env bash

readonly NEWLINE=$'\n'

EMAIL=$1
FILE_SUFFIX=$2
DOMAIN_NAME=$3
if [[ -z "${EMAIL}" || -z "${FILE_SUFFIX}" || -z "${DOMAIN_NAME}" || ! -z ${4} ]]; then
    echo "error: required args: <email> <file_suffix> <domain.name>"
    exit 1
fi

SSH_PATH=~/.ssh
FILE_NAME="id_rsa_${FILE_SUFFIX}"
FILE_PATH=${SSH_PATH}/${FILE_NAME}
GIT_USER="git"
GIT_HOST="${DOMAIN_NAME}-${FILE_SUFFIX}"

ssh-keygen -t rsa -C ${EMAIL} -f ${FILE_PATH}
pbcopy < ${FILE_PATH}.pub

echo "${NEWLINE}${SSH_PATH}/config"
echo "------------------------------------------------------------"
cat <<EOF
Host ${GIT_HOST}
   HostName ${DOMAIN_NAME}
   User ${GIT_USER}
   IdentityFile ${FILE_PATH}
EOF

echo "${NEWLINE}${SHELL_SCRIPTS_PATH}/init"
echo "------------------------------------------------------------"
cat <<EOF
   *"${GIT_USER}@${GIT_HOST}"*)
      git config user.email "${EMAIL}"
      ;;
EOF

echo "${NEWLINE}Clone repo as:"
cat <<EOF
git clone ${GIT_USER}@${GIT_HOST}:<git_account_name>/<repo_name>.git
EOF

# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
# ssh-add ~/.ssh/id_rsa_work_user1
# ssh-add -l            //list all ssh entries in the ssh-agent
# ssh-add -D            //removes all ssh entries from the ssh-agent
# ssh-add ~/.ssh/id_rsa // Adds the relevant ssh key
# git config user.name "User 1"
# git config user.email "user1@workMail.com"