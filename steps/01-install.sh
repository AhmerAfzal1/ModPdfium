#!/bin/bash -eux

# Source the environment to get PATH_FILE
source ${GITHUB_ENV:-.env}

sudo apt-get update
sudo apt-get install -y unzip git python3 python3-pip

# Install depot_tools (for gclient)
if [ ! -d "depot_tools" ]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
fi

# Export PATH immediately
export PATH="$PWD/depot_tools:$PATH"
echo "$PWD/depot_tools" >> "$PATH_FILE"

# Install Android NDK
ANDROID_NDK_VERSION="r29-beta3"
ANDROID_NDK_FOLDER="android-ndk-$ANDROID_NDK_VERSION"
ANDROID_NDK_ZIP="android-ndk-$ANDROID_NDK_VERSION-linux.zip"
if [ ! -d "$ANDROID_NDK_FOLDER" ];
then
  [ -f "$ANDROID_NDK_ZIP" ] || curl -Os "https://dl.google.com/android/repository/$ANDROID_NDK_ZIP"
  unzip -o -q "$ANDROID_NDK_ZIP"
  rm -f "$ANDROID_NDK_ZIP"
fi

# Add NDK to PATH
export PATH="$PWD/$ANDROID_NDK_FOLDER/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH"
echo "$PWD/$ANDROID_NDK_FOLDER/toolchains/llvm/prebuilt/linux-x86_64/bin" >> "$PATH_FILE"

# Also update GITHUB_ENV for subsequent steps
echo "PATH=$PATH" >> $GITHUB_ENV