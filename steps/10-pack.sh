#!/bin/bash -eux

IS_DEBUG=${PDFium_IS_DEBUG:-false}
CPU=${PDFium_TARGET_CPU:?}
STAGING="$PWD/staging"

ARTIFACT_BASE="pdfium-android-$CPU"
[ "$IS_DEBUG" == "true" ] && ARTIFACT_BASE="$ARTIFACT_BASE-debug"
ARTIFACT="$ARTIFACT_BASE.tgz"

# Create the tgz from staging directory contents
tar -czf "$ARTIFACT" -C "$STAGING" .

echo "Created artifact: $ARTIFACT"
echo "Artifact path: $PWD/$ARTIFACT"