# create_account

A create account application

## Getting Started

Created by: Ida Bagus Putu Peradnya Dinata

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run the App

### Run on Emulator
If you want run the app inside emulator, first you should find the `emulator_id` of emulator that you want to run. Below you can see the `emulator_id` of Pixel 3 XL API 30 is `Pixel_3_XL_API_30`.
```console
$ flutter emulators
1 available emulator:

Pixel_3_XL_API_30 • Pixel 3 XL API 30 • Google • android
```
After that, you start the command to run the emulator by its `emulator_id`, then you can start run the flutter app.
```console
$ flutter emulators --launch Pixel_3_XL_API_30
$ flutter run
```

### Run on Real Device
If you want run the app inside real device, first you should find the `device_id` of emulator that you want to run. Below you can see the `device_id` of sdk gphone x86 arm (mobile) is `emulator-5554`.
```console
$ flutter devices
1 connected device:

sdk gphone x86 arm (mobile) • emulator-5554 • android-x86 • Android 11 (API 30) (emulator)
```
After that, you can start run the flutter app on the device by its `device_id`.
```console
$ flutter run -d emulator-5554
```
## Unit Test

You can test the unit test of the project by using below command.
```console
$ flutter test
00:03 +21: All tests passed!
```

## Developer Note

There are several asumptions that used by developer when creating this apps:
* Flutter SDK and Android/iOS builder have been installed in the system.
* The **password complexity check result** is determined by number of passed validation. If only one validation pass out five then the result is VERY WEAK, and if all passed then the result is VERY STRONG.
* **Date formatted** in Bahasa Indonesia based on screenshot.
* **Back button** on the top of header will move the process to the previous one.