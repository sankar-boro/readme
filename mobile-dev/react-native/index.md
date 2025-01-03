### Running react-native on localhost

```sh
adb devices

# List of devices attached
# emulator-5554   device <--- emulator
# 2681523e        device <-- real device
```

```sh
adb -s emulator-5554 reverse tcp:3005 tcp:3005
adb -s 2681523e reverse tcp:3005 tcp:3005
```

```sh
cd ./android/
./gradlew bundleRelease
rm -rf app/build/generated
./gradlew assembleRelease
```

```sh
cd ./app/build/outputs/apk/release
mv app-release.apk app-release-v1.apk
```
