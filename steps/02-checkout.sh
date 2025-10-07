#!/bin/bash -eux

PDFium_URL='https://pdfium.googlesource.com/pdfium.git'
PDFium_BRANCH=${PDFium_BRANCH:-main}

CONFIG_ARGS=( --custom-var "checkout_configuration=minimal" )

# Clone/Config
gclient config --unmanaged "$PDFium_URL" "${CONFIG_ARGS[@]-}"
echo "target_os = [ 'android' ]" >> .gclient

# Reset repos
for FOLDER in pdfium pdfium/build pdfium/third_party/libjpeg_turbo pdfium/base/allocator/partition_allocator; do
  if [ -e "$FOLDER" ]; then
    git -C "$FOLDER" reset --hard
    git -C "$FOLDER" clean -df
  fi
done

# Sync
gclient sync -r "origin/$PDFium_BRANCH" --no-history --shallow