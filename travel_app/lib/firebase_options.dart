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
    apiKey: 'AIzaSyADxMhjb5ntoJSK4FAsxuQSK62QIvd3dnY',
    appId: '1:573540024793:web:0eb117003cc839c59cd9c8',
    messagingSenderId: '573540024793',
    projectId: 'paris-travel-aae5d',
    authDomain: 'paris-travel-aae5d.firebaseapp.com',
    storageBucket: 'paris-travel-aae5d.appspot.com',
    measurementId: 'G-GCDW2PQXTG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwWd4Lb1gAGulRC6Eh4Vbc1ZZxTyYNJZ0',
    appId: '1:573540024793:android:77e2bef86da417f59cd9c8',
    messagingSenderId: '573540024793',
    projectId: 'paris-travel-aae5d',
    storageBucket: 'paris-travel-aae5d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAswJyFKVY65S-_GWiVyXxMMr4LfRJbodc',
    appId: '1:573540024793:ios:bef38d82f5a0769a9cd9c8',
    messagingSenderId: '573540024793',
    projectId: 'paris-travel-aae5d',
    storageBucket: 'paris-travel-aae5d.appspot.com',
    iosBundleId: 'com.example.travelApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAswJyFKVY65S-_GWiVyXxMMr4LfRJbodc',
    appId: '1:573540024793:ios:bef38d82f5a0769a9cd9c8',
    messagingSenderId: '573540024793',
    projectId: 'paris-travel-aae5d',
    storageBucket: 'paris-travel-aae5d.appspot.com',
    iosBundleId: 'com.example.travelApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADxMhjb5ntoJSK4FAsxuQSK62QIvd3dnY',
    appId: '1:573540024793:web:badf52ebfdf2a35b9cd9c8',
    messagingSenderId: '573540024793',
    projectId: 'paris-travel-aae5d',
    authDomain: 'paris-travel-aae5d.firebaseapp.com',
    storageBucket: 'paris-travel-aae5d.appspot.com',
    measurementId: 'G-TTLTFF71Q1',
  );
}