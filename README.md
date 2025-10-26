# Webview POC App

A cross-platform Flutter application demonstrating multi-tab webview functionality for iOS, iPadOS, macOS, and Android.

## Features

- Six-tab interface with bottom navigation
- Each tab displays a configurable webview
- State preservation for each tab (scroll, navigation history)
- Settings screen for URL configuration (persisted across sessions)
- Loading indicator and error handling
- Consistent UI/UX across all platforms

## Architecture

- Flutter (Dart)
- Bloc for state management
- webview_flutter plugin
- shared_preferences for local storage
- Clean separation of UI and business logic

## Project Structure

See [`architecture.md`](architecture.md:1) for full details.

## Setup

1. Install [Flutter](https://flutter.dev/docs/get-started/install)
2. Run `flutter pub get`
3. To run on a device: `flutter run`
4. To build for release: `flutter build <platform>`

## CI/CD

Automated builds and tests via GitHub Actions ([`.github/workflows/flutter.yml`](.github/workflows/flutter.yml:1)).

## App Assets

- App icon: 1024x1024px (see platform asset folders)
- Screenshots: Required for App Store/Google Play submission
- Privacy policy: Required for app store compliance

## Permissions

- Android: Internet permission in [`AndroidManifest.xml`](android/app/src/main/AndroidManifest.xml:1)
- iOS/macOS: NSAppTransportSecurity in [`Info.plist`](ios/Runner/Info.plist:1), [`Info.plist`](macos/Runner/Info.plist:1)

## License

MIT
