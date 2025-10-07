#!/bin/bash -eux

ENV_FILE=${GITHUB_ENV:-.env}
PATH_FILE=${GITHUB_PATH:-.path}

# Create the path file if it doesn't exist
touch "$PATH_FILE"

# Input parameters
cat >>"$ENV_FILE" <<END
PDFium_SOURCE_DIR=$PWD/pdfium
PDFium_BUILD_DIR=$PWD/pdfium/out
PDFium_BRANCH=${PDFium_BRANCH:-main}
ANDROID_NDK_VERSION=${ANDROID_NDK_VERSION:-r29}
ANDROID_MIN_SDK=24
DEPOT_TOOLS_WIN_TOOLCHAIN=0
PATH_FILE=$PATH_FILE
END