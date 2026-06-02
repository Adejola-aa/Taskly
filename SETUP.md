# 🔧 Development Setup Guide

Complete guide to set up your Taskly development environment.

---

## 📋 Prerequisites

Before you begin, ensure you have:

- **Flutter SDK** 3.11.5 or higher
  - [Install Flutter](https://flutter.dev/docs/get-started/install)
  - Run `flutter --version` to verify

- **Dart SDK** 3.11.5 or higher (comes with Flutter)

- **Git** for version control
  - [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

- **A Firebase Project** (see Firebase Setup section)

### Platform-Specific Requirements

#### Android Development
- Android SDK (API level 21 or higher)
- Android Studio or similar IDE
- A physical device or emulator

#### iOS Development
- Xcode 12.0 or higher
- CocoaPods
- A physical device or simulator
- Apple Developer account (for releases)

#### Web Development
- Chrome, Firefox, or Safari browser

#### Windows/Linux Development
- Visual Studio Code or similar editor
- C++ build tools (for Windows)
- GCC/Clang (for Linux)

---

## 🚀 Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/taskly.git
cd taskly
```

### 2. Get Flutter Dependencies

```bash
flutter pub get
```

This will install all dependencies defined in `pubspec.yaml`.

### 3. Setup Firebase

#### A. Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click **"Create a project"**
3. Name your project "Taskly"
4. Accept the terms and create

#### B. Configure Android

1. In Firebase Console, click **"Add app"** → **"Android"**
2. Follow the setup wizard:
   - Package name: `com.example.taskly` (or your package name)
   - Nickname: Taskly Android
   - SHA-1 certificate: 
     ```bash
     # Get SHA-1 fingerprint
     keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
     ```
   - Register app
3. Download `google-services.json`
4. Place it in: `android/app/google-services.json`

#### C. Configure iOS

1. In Firebase Console, click **"Add app"** → **"iOS"**
2. Follow the setup wizard:
   - Bundle ID: `com.example.taskly` (or your bundle ID)
   - Nickname: Taskly iOS
   - Download `GoogleService-Info.plist`
3. Place it in: `ios/Runner/GoogleService-Info.plist`
4. In Xcode:
   - Open `ios/Runner.xcworkspace`
   - Drag `GoogleService-Info.plist` into Runner folder
   - Make sure it's added to Runner target

#### D. Enable Firebase Services

In Firebase Console:

1. **Authentication**
   - Go to Authentication → Sign-in method
   - Enable: Google, Apple, Email/Password

2. **Firestore Database**
   - Go to Firestore Database
   - Create database (Start in test mode for development)
   - Choose region (e.g., us-central1)

3. **Cloud Messaging** (for notifications)
   - Go to Cloud Messaging
   - Note your Server Key (for backend)

#### E. Update Firebase Configuration (if needed)

If using custom Firebase configuration, update `lib/firebase_options.dart`:

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Generate new options
flutterfire configure
```

---

## 🏃 Running the App

### Run on Default Device

```bash
flutter run
```

### Run on Specific Device

```bash
# List all devices
flutter devices

# Run on specific device
flutter run -d <device_id>
```

### Run with Custom Flavor

```bash
# Development
flutter run --flavor dev

# Production
flutter run --flavor prod
```

### Hot Reload During Development

While the app is running, press:
- **R** - Hot Reload (fast, keeps state)
- **r** - Full Restart (slower, clears state)
- **Q** - Quit

---

## 🏗️ Project Structure Explained

```
taskly/
├── android/                    # Android native code
│   ├── app/
│   │   └── google-services.json   # Firebase config
│   └── build.gradle.kts
│
├── ios/                        # iOS native code
│   ├── Runner/
│   │   └── GoogleService-Info.plist  # Firebase config
│   └── Podfile
│
├── lib/                        # Dart/Flutter source code
│   ├── config/
│   │   ├── router/            # Navigation setup
│   │   │   └── app_router.dart
│   │   └── theme/             # App theme & colors
│   │       └── theme.dart
│   │
│   ├── core/
│   │   ├── constants/         # App-wide constants
│   │   ├── error/             # Error handling
│   │   ├── usecases/          # Base classes for use cases
│   │   └── utils/             # Utility functions
│   │
│   ├── feature/               # Feature-based modules
│   │   ├── auth/
│   │   │   ├── data/          # Data layer (repositories, datasources)
│   │   │   │   ├── datasource/
│   │   │   │   └── repository/
│   │   │   ├── domain/        # Domain layer (entities, usecases)
│   │   │   │   ├── entity/
│   │   │   │   └── usecase/
│   │   │   └── presentation/  # UI layer (pages, providers, widgets)
│   │   │       ├── pages/
│   │   │       ├── providers/
│   │   │       └── widgets/
│   │   │
│   │   └── onboarding/        # Similar structure
│   │
│   ├── widgets/               # Reusable widgets
│   │   └── common_widgets.dart
│   │
│   ├── firebase_options.dart  # Firebase initialization config
│   └── main.dart             # App entry point
│
├── test/                      # Test files
│   └── widget_test.dart
│
├── assets/                    # Static assets
│   ├── images/
│   ├── icons/
│   └── fonts/
│
├── pubspec.yaml              # Dependencies and metadata
├── analysis_options.yaml     # Linting rules
└── README.md                 # User documentation
```

---

## 📦 Key Dependencies Explained

### State Management
- **flutter_riverpod** (3.3.1) - Reactive state management

### Networking & Cloud
- **firebase_core** (4.7.0) - Firebase initialization
- **firebase_auth** (6.4.0) - User authentication
- **cloud_firestore** (6.3.0) - Cloud database
- **google_sign_in** (7.2.0) - Google OAuth
- **sign_in_with_apple** (8.0.0) - Apple OAuth

### Navigation
- **go_router** (17.2.3) - Modern routing

### Local Storage
- **shared_preferences** (2.5.5) - Simple key-value storage

### Utilities
- **fpdart** (1.2.0) - Functional programming
- **logger** (2.7.0) - Logging utility
- **flutter_native_splash** (2.4.7) - Native splash screens

---

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the project root (optional):

```env
FIREBASE_API_KEY=your_api_key
FIREBASE_PROJECT_ID=your_project_id
```

### Linting Configuration

Code style is enforced by `analysis_options.yaml`. Run:

```bash
# Analyze code
flutter analyze

# Format code automatically
dart format lib/
```

---

## 📱 Testing

### Run Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run tests for specific file
flutter test test/widget_test.dart
```

### Test Coverage

View coverage report (requires `lcov`):

```bash
# Generate coverage
flutter test --coverage

# View report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 🏗️ Building for Release

### Android Release Build

```bash
# Create signed APK
flutter build apk --release

# Create App Bundle (recommended for Play Store)
flutter build appbundle --release
```

Output location: `build/app/release/`

### iOS Release Build

```bash
# Build for physical device
flutter build ios --release

# Build for simulator
flutter build ios --simulator
```

Then open in Xcode:
```bash
open ios/Runner.xcworkspace
```

### Web Release Build

```bash
flutter build web --release
```

Output: `build/web/`

---

## 🐛 Debugging

### Enable Debug Logging

In `main.dart`, add:

```dart
import 'package:logger/logger.dart';

final logger = Logger();

void main() {
  logger.i('App started');
  // ... rest of main
}
```

### Use DevTools

```bash
# Open DevTools
flutter pub global activate devtools
devtools
```

Then run your app with:
```bash
flutter run
```

DevTools will automatically open in your browser.

### Common Issues

#### Firebase Connection Issues
- Verify `google-services.json` is in `android/app/`
- Verify `GoogleService-Info.plist` is in `ios/Runner/`
- Check Firebase Console for enabled services

#### Build Failures
```bash
# Clean build cache
flutter clean

# Get fresh dependencies
flutter pub get

# Rebuild
flutter run
```

#### Hot Reload Not Working
- Do a full restart: Press **r** in terminal
- If still failing, stop and restart: `flutter run`

---

## 📚 Additional Resources

- [Flutter Docs](https://docs.flutter.dev)
- [Firebase Docs](https://firebase.google.com/docs)
- [Dart Docs](https://dart.dev/guides)
- [Riverpod Docs](https://riverpod.dev)
- [GoRouter Docs](https://pub.dev/packages/go_router)

---

## ✅ Verification Checklist

Before starting development, verify:

- [ ] Flutter SDK installed and version 3.11.5+
- [ ] `flutter pub get` completed successfully
- [ ] Firebase project created
- [ ] Android: `google-services.json` placed in `android/app/`
- [ ] iOS: `GoogleService-Info.plist` placed in `ios/Runner/`
- [ ] Firebase services enabled (Auth, Firestore, Messaging)
- [ ] `flutter run` works on your target device/emulator

---

**Happy coding! 🎉**

For issues or questions, refer to the troubleshooting section or open an issue on GitHub.
