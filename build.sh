#!/bin/bash -eu

CPU_NAMES="arm arm64 x64 x86"
STEP_REGEX="[0-9]"

START_STEP=0

if [[ $# == 0 ]]
then
  echo "PDFium build script (Android only, no V8).
https://github.com/bblanchon/pdfium-binaries

Usage $0 [options] cpu

Arguments:
   cpu      = Target CPU ($CPU_NAMES)

Options:
  -b branch = Chromium branch (default=main)
  -s 0-10   = Set start step (default=0)
  -d        = debug build"
  exit
fi

while getopts "b:ds:" OPTION
do
  case $OPTION in
    b)
      export PDFium_BRANCH="$OPTARG"
      ;;
    d)
      export PDFium_IS_DEBUG=true
      ;;
    s)
      START_STEP="$OPTARG"
      ;;
    *)
      echo "Invalid flag -$OPTION"
      exit 1
  esac
done
shift $(($OPTIND - 1))

if [[ $# -lt 1 ]]
then
  echo "You must specify target CPU"
  exit 1
fi

if [[ ! $1 =~ ^($CPU_NAMES)$ ]]
then
  echo "Unknown CPU: $1"
  exit 1
fi

if [[ ! $START_STEP =~ ^($STEP_REGEX)$ ]]
then
  echo "Invalid step number: $START_STEP"
  exit 1
fi

export PDFium_TARGET_OS=android
export PDFium_TARGET_CPU=$1
export PDFium_TARGET_ENVIRONMENT=
export PDFium_ENABLE_V8=false

set -x

ENV_FILE=${GITHUB_ENV:-.env}
PATH_FILE=${GITHUB_PATH:-.path}

# Create files if they don't exist
touch "$ENV_FILE"
touch "$PATH_FILE"

[ $START_STEP -le 0 ] && bash steps/00-environment.sh
source "$ENV_FILE"

[ $START_STEP -le 1 ] && bash steps/01-install.sh
if [ -f "$PATH_FILE" ]; then
  PATH="$(tr '\n' ':' < "$PATH_FILE")$PATH"
  export PATH
fi

[ $START_STEP -le 2 ] && bash steps/02-checkout.sh
[ $START_STEP -le 3 ] && bash steps/03-patch.sh
[ $START_STEP -le 4 ] && bash steps/04-install-extras.sh
[ $START_STEP -le 5 ] && bash steps/05-configure.sh
[ $START_STEP -le 6 ] && bash steps/06-build.sh
[ $START_STEP -le 7 ] && bash steps/07-stage.sh
[ $START_STEP -le 8 ] && bash steps/08-licenses.sh
[ $START_STEP -le 9 ] && bash steps/09-test.sh
[ $START_STEP -le 10 ] && bash steps/10-pack.sh