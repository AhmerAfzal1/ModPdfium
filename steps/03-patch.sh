#!/bin/bash -eux

PATCHES="$PWD/patches"
SOURCE="${PDFium_SOURCE_DIR:-pdfium}"
ENABLE_V8=${PDFium_ENABLE_V8:-false}

apply_patch() {
  local FILE="$1"
  local DIR="${2:-.}"
  patch --verbose -p1 -d "$DIR" -i "$FILE"
}

pushd "${SOURCE}"

# Apply patches
apply_patch "$PATCHES/shared_library.patch"
apply_patch "$PATCHES/public_headers.patch"
apply_patch "$PATCHES/android/build.patch" build

popd