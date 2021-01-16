echo off

# notes:
# - run using:
#   `sh -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init.cmd)"`

goto() {
# Linux
readonly UNAME_OUT="$(uname -s)"
echo ${UNAME_OUT}
case "${UNAME_OUT}" in
  Linux*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init-linux.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/scripts/workstation/master/init-filesystem.sh)"
    @REM RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${VERSION_AWS_CLI}.zip" -o "awscliv2.zip" \
    @REM   && ls -lh awscliv2.zip \
    @REM   && unzip awscliv2.zip \
    @REM   && ./aws/install \
    @REM   && aws --version
    @REM curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
    @REM unzip awscliv2.zip
    @REM sudo ./aws/install
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