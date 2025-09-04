#!/bin/bash -eux

PATH_FILE=${GITHUB_PATH:-$PWD/.path}
SOURCE="${PDFium_SOURCE_DIR:-pdfium}"

pushd "$SOURCE"

# Install Android build dependencies
build/install-build-deps.sh --android

# Run gclient hooks
gclient runhooks

popd