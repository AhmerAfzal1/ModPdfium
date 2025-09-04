#!/bin/bash -eux

IS_DEBUG=${PDFium_IS_DEBUG:-false}
VERSION=${PDFium_VERSION:-}
PATCHES="$PWD/patches"

SOURCE=${PDFium_SOURCE_DIR:-pdfium}
BUILD=${PDFium_BUILD_DIR:-pdfium/out/android}

STAGING="$PWD/staging"
STAGING_BIN="$STAGING/bin"
STAGING_LIB="$STAGING/lib"

mkdir -p "$STAGING"
mkdir -p "$STAGING_LIB"

# Generate PDFiumConfig.cmake
sed "s/#VERSION#/${VERSION:-0.0.0.0}/" <"$PATCHES/PDFiumConfig.cmake" >"$STAGING/PDFiumConfig.cmake"

# Copy license
cp "$SOURCE/LICENSE" "$STAGING"
cat >>"$STAGING/LICENSE" <<END

This package also includes third-party software. See the licenses/ directory for their respective licenses.
END

# Copy build args
cp "$BUILD/args.gn" "$STAGING"

# Copy headers
cp -R "$SOURCE/public" "$STAGING/include"
rm -f "$STAGING/include/DEPS" "$STAGING/include/README" "$STAGING/include/PRESUBMIT.py"

# Copy library
mv "$BUILD/libpdfium.so" "$STAGING_LIB"

# Write version file
if [ -n "$VERSION" ]; then
  cat >"$STAGING/VERSION" <<END
MAJOR=$(echo "$VERSION" | cut -d. -f1)
MINOR=$(echo "$VERSION" | cut -d. -f2)
BUILD=$(echo "$VERSION" | cut -d. -f3)
PATCH=$(echo "$VERSION" | cut -d. -f4)
END
fi