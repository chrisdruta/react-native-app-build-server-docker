#!/bin/bash

path="/usr/apps/mobile-app"
secret="mysecret" # Should read this in from a file or something

# Clean up build paths
rm -rf $path/android/app/build
mkdir -p $path/android/app/build/intermediates/assets/debug/

if [ "$(git rev-parse HEAD)" -ne "$(git rev-parse origin/master)"]
then
    cd $path

    # bundle react native js
    react-native bundle --dev false --platform android --entry-file index.js --bundle-output $path/android/app/build/intermediates/assets/debug/index.android.bundle --assets-dest $path/android/app/build/intermediates/res/merged/debug

    # build apk
    cd $path/android
    ./gradlew assembleRelease
    echo $secret | jarsigner -verbose -keystore $path/android/key.keystore $path/android/app/build/outputs/apk/release/app-release-unsigned.apk app-alias

    zipalign -f -v 4 $path/android/app/build/outputs/apk/release/app-release-unsigned.apk /usr/apps/web-app/private/private-release.apk
    exit 1
elif ["$(git rev-parse HEAD)" -eq "$(git rev-parse origin/master)"]
then
    exit 2
fi

exit 0
