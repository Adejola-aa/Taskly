# 🔧 Development Setup Guide

Complete guide to set up your Taskly development environment.

---

## 📋 Prerequisites

Before you begin, ensure you have:

- **Flutter SDK** 3.41.7 or higher
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
---

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
