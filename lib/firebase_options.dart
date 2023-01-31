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
    apiKey: 'AIzaSyATNU72bpnvofLhj1cfjalwR41JiKFVBcA',
    appId: '1:200179531546:web:1060a046e2b661c7a6f6a3',
    messagingSenderId: '200179531546',
    projectId: 'government-flutter-app',
    authDomain: 'government-flutter-app.firebaseapp.com',
    storageBucket: 'government-flutter-app.appspot.com',
    measurementId: 'G-J8P56F2X8P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPee7tI4CiG2kY6PRoyxFuMzsiNe8Yqqo',
    appId: '1:200179531546:android:caa881d8235e2821a6f6a3',
    messagingSenderId: '200179531546',
    projectId: 'government-flutter-app',
    storageBucket: 'government-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCibctjjgwe5sGmnVhOCLGBmDzSDsvsv18',
    appId: '1:200179531546:ios:5d755c1607a3f409a6f6a3',
    messagingSenderId: '200179531546',
    projectId: 'government-flutter-app',
    storageBucket: 'government-flutter-app.appspot.com',
    iosClientId: '200179531546-9ofjpvv3qefbo59oo8r09oq73hn5f092.apps.googleusercontent.com',
    iosBundleId: 'com.example.govermentFlutterSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCibctjjgwe5sGmnVhOCLGBmDzSDsvsv18',
    appId: '1:200179531546:ios:51bb6049e72a9218a6f6a3',
    messagingSenderId: '200179531546',
    projectId: 'government-flutter-app',
    storageBucket: 'government-flutter-app.appspot.com',
    iosClientId: '200179531546-1nobkl4jeogf336dksv0v9l4jia1apj7.apps.googleusercontent.com',
    iosBundleId: 'com.example.govermentFlutterSystem.RunnerTests',
  );
}
