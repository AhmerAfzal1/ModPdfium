#!/bin/bash -eux

SOURCE=${PDFium_SOURCE_DIR:-pdfium}
BUILD_DIR=${PDFium_BUILD_DIR:-$SOURCE/out/android}
TARGET_CPU=${PDFium_TARGET_CPU:?}

# Build pdfium
ninja -C "$BUILD_DIR" pdfium