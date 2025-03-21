# Flutter Dating App (incomplete)

## Overview
The **Flutter Dating App** is a modern mobile application that connects people based on their preferences. It features Firebase Authentication for secure login and Firestore for real-time database management.

## Features
- ✅ **User Authentication** (Email & Password, Google Sign-In)
- ✅ **User Profiles** with photos, bio, and preferences
- ✅ **Swipe-based Matching System**
- ✅ **Real-time Chat System**
- ✅ **Firestore Database for User Data Storage**
- ✅ **Push Notifications for Messages & Matches**

## Tech Stack
- **Frontend:** Flutter (Dart)
- **Backend:** Firebase Firestore
- **Authentication:** Firebase Authentication (Email, Google Sign-In)
- **State Management:** GETX
- **Push Notifications:** Firebase Cloud Messaging (FCM)

## Setup Instructions

### Prerequisites
- Install **Flutter** ([Installation Guide](https://flutter.dev/docs/get-started/install))
- Create a **Firebase Project** on [Firebase Console](https://console.firebase.google.com/)
- Enable **Firebase Authentication** (Email/Google Sign-In)
- Enable **Cloud Firestore** for real-time data storage
- Enable **Firebase Cloud Messaging (FCM)** for notifications
- Download `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) and place it in the project directory

### Installation Steps
```sh
# Clone the repository
git clone <repository-url>

# Navigate to the project directory
cd flutter_dating_app

# Get the dependencies
flutter pub get

# Run the application
flutter run
```

## Firebase Integration
### Add Dependencies
Include these in `pubspec.yaml`:
```yaml
dependencies:
  firebase_core: latest_version
  firebase_auth: latest_version
  cloud_firestore: latest_version
  google_sign_in: latest_version
  firebase_messaging: latest_version
  get: latest_version
```

### Initialize Firebase in `main.dart`
```dart
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

### Implement Google Sign-In
```dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth auth = FirebaseAuth.instance;

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  if (googleUser == null) return null;
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  return await auth.signInWithCredential(credential);
}
```



