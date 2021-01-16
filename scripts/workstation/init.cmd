echo off

goto() {
# Linux
readonly UNAME_OUT="$(uname -s)"
echo ${UNAME_OUT}
case "${UNAME_OUT}" in
  Linux*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/scripts/workstation/init-linux.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/scripts/workstation/init-filesystem.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/scripts/workstation/init-cli.sh)"
  ;;
  Darwin*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/scripts/workstation/init-mac.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/gkoehl/public/master/scripts/workstation/init-filesystem.sh)"
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