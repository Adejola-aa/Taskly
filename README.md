# 🚀 Taskly

**Your intelligent task management companion**

Taskly is a modern, feature-rich todo app designed to help you stay organized, focused, and on top of your daily tasks. Unlike traditional todo apps, Taskly combines smart reminders, real-time notifications, and seamless cloud synchronization to keep you connected to your goals.

## 🧠 Purpose

Taskly was built to solve a simple problem:

> "People struggle to stay organized and consistent with daily tasks."

This app focuses on **clarity, speed, and simplicity**, avoiding unnecessary complexity while still feeling powerful.

---

## ✨ Key Features

- 📋 **Task Management** - Create, edit, and organize your tasks with ease
- 🔔 **Smart Reminders** - Get notified before your tasks are due
- ☁️ **Cloud Sync** - Your tasks sync instantly across all your devices
- 🔐 **Secure Authentication** - Sign in with Google, Apple, or email
- 🌙 **Dark Mode** - Comfortable for your eyes, day or night
- 📱 **Responsive Design** - Optimized for both phones and tablets
- ⚡ **Fast & Lightweight** - Built for performance
- 🌐 **Offline Support** - Works even without internet

---

## 🛠️ Tech Stack

### Frontend
- **Framework**: Flutter
- **UI Framework**: Material Design
- **State Management**: Riverpod
- **Navigation**: GoRouter

### Backend & Services
- **Authentication**: Firebase Auth (Google, Apple, Email)
- **Database**: Cloud Firestore
- **Notifications**: Firebase Cloud Messaging (FCM)

### Local Storage
- **Preferences**: SharedPreferences
- **Local Caching**: Firestore local cache

### Development
- **Language**: Dart 3.11.5+
- **Build System**: Flutter Build
- **Linting**: Flutter Lints

---

## 📦 Installation

### Prerequisites
- Flutter SDK (3.11.5 or higher)
- Dart SDK (included with Flutter)
- Android SDK (for Android development)
- Xcode (for iOS development)
- A Firebase project

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/taskly.git
   cd taskly
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase** (See [SETUP.md](SETUP.md) for detailed Firebase setup)

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🎯 How to Use

### Creating a Task
1. Tap the **"+"** button to create a new task
2. Enter task title and description
3. Set a due date and time
4. (Optional) Add a reminder notification
5. Tap **"Save"**

### Managing Tasks
- **Mark as Complete**: Swipe or tap the checkbox
- **Edit**: Tap the task to edit
- **Delete**: Swipe left or right to delete
- **Organize**: Use categories or tags

### Setting Reminders
1. Open a task
2. Tap **"Add Reminder"**
3. Choose reminder time (5 min, 15 min, 1 hour, 1 day before)
4. Save

### Cloud Sync
- Your tasks automatically sync to the cloud
- Access your tasks from any device
- Real-time updates across devices

---

## 🏗️ Project Structure

```
lib/
├── config/              # App configuration
│   ├── router/         # GoRouter setup & routes
│   └── theme/          # App theme & styling
├── core/               # Core utilities
│   ├── constants/      # App constants
│   ├── error/          # Error handling
│   ├── usecases/       # Base use case classes
│   └── utils/          # Utility functions
├── feature/            # Feature modules (Clean Architecture)
│   ├── auth/          # Authentication feature
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── onboarding/    # Onboarding feature
├── widgets/           # Reusable widgets
├── firebase_options.dart
└── main.dart
```

---

## 🔧 Development

### Building for Release
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

```

---


## 🔐 Security

- All data is encrypted in transit (HTTPS/TLS)
- Firebase Security Rules protect user data
- Passwords are securely hashed in Firebase
- No sensitive data is stored locally

---

## 🚀 Getting Help

### Documentation
- [Setup Guide](SETUP.md) - Detailed development setup
- [Flutter Documentation](https://docs.flutter.dev)
- [Firebase Documentation](https://firebase.google.com/docs)

### Support
- 📧 Email: support@taskly.app
- 🐛 Found a bug? [Open an issue](https://github.com/yourusername/taskly/issues)
- 💡 Feature request? [Start a discussion](https://github.com/yourusername/taskly/discussions)

---

## 🙏 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

**Built with ❤️ by the Taskly Team**

*Stay organized. Stay focused. Stay on top of your tasks.*
