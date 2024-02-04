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
    apiKey: 'AIzaSyAd0Qi9BNjob3bk7r0HO3gPaoi42REn4GE',
    appId: '1:676669175549:web:3239f6bca1436f51d43094',
    messagingSenderId: '676669175549',
    projectId: 'cat-application-ac05a',
    authDomain: 'cat-application-ac05a.firebaseapp.com',
    storageBucket: 'cat-application-ac05a.appspot.com',
    measurementId: 'G-9C4BT7YRQN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBi4IEiCXsQ6qV92vVJsrJsiy1ULloSnoU',
    appId: '1:676669175549:android:f3824c1782829754d43094',
    messagingSenderId: '676669175549',
    projectId: 'cat-application-ac05a',
    storageBucket: 'cat-application-ac05a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYab94KVtKcrgrqWovydd7-NLipnF47Ro',
    appId: '1:676669175549:ios:ccb7b7416dd56d87d43094',
    messagingSenderId: '676669175549',
    projectId: 'cat-application-ac05a',
    storageBucket: 'cat-application-ac05a.appspot.com',
    iosBundleId: 'com.example.nyanCatWar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYab94KVtKcrgrqWovydd7-NLipnF47Ro',
    appId: '1:676669175549:ios:919143cc192e0384d43094',
    messagingSenderId: '676669175549',
    projectId: 'cat-application-ac05a',
    storageBucket: 'cat-application-ac05a.appspot.com',
    iosBundleId: 'com.example.nyanCatWar.RunnerTests',
  );
}
