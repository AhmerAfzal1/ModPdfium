#!/bin/bash -eux

# Simple test to check if library exists
if [ -f "$PWD/staging/lib/libpdfium.so" ]; then
    echo "Build successful - libpdfium.so found"
    file "$PWD/staging/lib/libpdfium.so"
else
    echo "Build failed - libpdfium.so not found"
    exit 1
fi