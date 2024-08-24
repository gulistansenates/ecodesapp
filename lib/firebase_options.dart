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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBYaD9DJgTrzxezkeCut01ZUjBeJnROdqI',
    appId: '1:335151329506:web:78cc97d2775aa3618baebb',
    messagingSenderId: '335151329506',
    projectId: 'e-codes-app',
    authDomain: 'e-codes-app.firebaseapp.com',
    storageBucket: 'e-codes-app.appspot.com',
    measurementId: 'G-SHT6W84ZGT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQ-hrPTDcG-MOQezXjFPDKei78YyRDK54',
    appId: '1:335151329506:android:b377cf9d185c04e28baebb',
    messagingSenderId: '335151329506',
    projectId: 'e-codes-app',
    storageBucket: 'e-codes-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvJ4U5ae02DBkIOhFaCuIEbB7eXsGTO40',
    appId: '1:335151329506:ios:5234c722db6e57548baebb',
    messagingSenderId: '335151329506',
    projectId: 'e-codes-app',
    storageBucket: 'e-codes-app.appspot.com',
    iosBundleId: 'com.example.ekodlariapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvJ4U5ae02DBkIOhFaCuIEbB7eXsGTO40',
    appId: '1:335151329506:ios:5234c722db6e57548baebb',
    messagingSenderId: '335151329506',
    projectId: 'e-codes-app',
    storageBucket: 'e-codes-app.appspot.com',
    iosBundleId: 'com.example.ekodlariapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBYaD9DJgTrzxezkeCut01ZUjBeJnROdqI',
    appId: '1:335151329506:web:920baa941c3753698baebb',
    messagingSenderId: '335151329506',
    projectId: 'e-codes-app',
    authDomain: 'e-codes-app.firebaseapp.com',
    storageBucket: 'e-codes-app.appspot.com',
    measurementId: 'G-1G3TJ6S2ZR',
  );
}
