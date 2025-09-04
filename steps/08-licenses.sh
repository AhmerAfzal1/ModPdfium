#!/bin/bash -eux

SOURCE_DIR=${PDFium_SOURCE_DIR:-pdfium}
BUILD_DIR=${PDFium_BUILD_DIR:-pdfium/out/android}
OUTPUT_DIR="$PWD/staging/licenses"

mkdir -p "$OUTPUT_DIR"

# Extract and copy licenses (simplified version)
cp "$SOURCE_DIR/LICENSE" "$OUTPUT_DIR/pdfium.txt"
[ -f "$SOURCE_DIR/third_party/freetype/FTL.TXT" ] && cp "$SOURCE_DIR/third_party/freetype/FTL.TXT" "$OUTPUT_DIR/freetype.txt"
[ -f "$SOURCE_DIR/third_party/libjpeg_turbo/LICENSE.md" ] && cp "$SOURCE_DIR/third_party/libjpeg_turbo/LICENSE.md" "$OUTPUT_DIR/libjpeg_turbo.txt"