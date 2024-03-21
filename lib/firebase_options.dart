// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBPtBSt6MFX09iXj56oO9NsZwRrf1DhPO8',
    appId: '1:136362130488:web:5c9cc3df7a04db84d67acd',
    messagingSenderId: '136362130488',
    projectId: 'dating-app-ab16e',
    authDomain: 'dating-app-ab16e.firebaseapp.com',
    storageBucket: 'dating-app-ab16e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQM9toRJTTtbpDJA-cGji5jfq52A6FMnw',
    appId: '1:136362130488:android:4713b051d088ae94d67acd',
    messagingSenderId: '136362130488',
    projectId: 'dating-app-ab16e',
    storageBucket: 'dating-app-ab16e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbI2N7Y3OgpFVPHrsfApW3n4U8PCEvRzc',
    appId: '1:136362130488:ios:95b2d668aa8c22a4d67acd',
    messagingSenderId: '136362130488',
    projectId: 'dating-app-ab16e',
    storageBucket: 'dating-app-ab16e.appspot.com',
    androidClientId: '136362130488-012qk7iscbgdl33269i1ebo81im3j7vd.apps.googleusercontent.com',
    iosClientId: '136362130488-vqn1fqvl519ts83qtc9bh1crtjn11dmg.apps.googleusercontent.com',
    iosBundleId: 'com.example.datingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbI2N7Y3OgpFVPHrsfApW3n4U8PCEvRzc',
    appId: '1:136362130488:ios:5bf35674719a5661d67acd',
    messagingSenderId: '136362130488',
    projectId: 'dating-app-ab16e',
    storageBucket: 'dating-app-ab16e.appspot.com',
    androidClientId: '136362130488-012qk7iscbgdl33269i1ebo81im3j7vd.apps.googleusercontent.com',
    iosClientId: '136362130488-abk6ma649pasakdii80vonjgmgio4uo9.apps.googleusercontent.com',
    iosBundleId: 'com.example.datingApp.RunnerTests',
  );
}
