// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDxHPSdn7peMh1p89Z7EY85D3LtmjumeR0',
    appId: '1:340966523987:web:cd1e580dada6460620b2a6',
    messagingSenderId: '340966523987',
    projectId: 'deshii-mart',
    authDomain: 'deshii-mart.firebaseapp.com',
    storageBucket: 'deshii-mart.appspot.com',
    measurementId: 'G-44YJDR1L91',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl3QmA9LtV207oUJlRFv_6NJr0dRSX_8M',
    appId: '1:340966523987:android:659e7702d689ac8920b2a6',
    messagingSenderId: '340966523987',
    projectId: 'deshii-mart',
    storageBucket: 'deshii-mart.appspot.com',
  );
}
