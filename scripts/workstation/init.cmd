echo off

goto() {
# Linux
# notes:
# - run using:
#   `sh -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/scripts/workstation/init.cmd)"`

readonly UNAME_OUT="$(uname -s)"
echo ${UNAME_OUT}
case "${UNAME_OUT}" in
  Linux*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init-linux.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init-filesystem.sh)"
    # RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${VERSION_AWS_CLI}.zip" -o "awscliv2.zip" \
    #   && ls -lh awscliv2.zip \
    #   && unzip awscliv2.zip \
    #   && ./aws/install \
    #   && aws --version
    # curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
    # unzip awscliv2.zip
    # sudo ./aws/install
  ;;
  Darwin*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init-mac.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init-filesystem.sh)"
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init-cli.sh)"
  ;;
  CYGWIN*)
  ;;
  MINGW*)
  ;;
  *)
    echo "error: unknown device os (${UNAME_OUT})"
  ;;
esac
}
goto $@
exit

:() {
REM Windows
echo %OS%
exit