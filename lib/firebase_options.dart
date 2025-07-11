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
    apiKey: 'AIzaSyCfAhEh7FWoCnTr2eZvtl5MffPSXZeepIc',
    appId: '1:1092550034303:web:5854d28a4b65cdda97104a',
    messagingSenderId: '1092550034303',
    projectId: 'task-486b3',
    authDomain: 'task-486b3.firebaseapp.com',
    storageBucket: 'task-486b3.firebasestorage.app',
    measurementId: 'G-DZQ1PY373R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtEBBLveGMEMY74axdboh_Fxv9iXsNJvI',
    appId: '1:1092550034303:android:9f984db04dcec05397104a',
    messagingSenderId: '1092550034303',
    projectId: 'task-486b3',
    storageBucket: 'task-486b3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAv8NGsn9iKth3EJtfkbwdjiDrjXMk76Kc',
    appId: '1:1092550034303:ios:9cdf25f8c35613cf97104a',
    messagingSenderId: '1092550034303',
    projectId: 'task-486b3',
    storageBucket: 'task-486b3.firebasestorage.app',
    iosBundleId: 'com.example.ideasnconcepts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAv8NGsn9iKth3EJtfkbwdjiDrjXMk76Kc',
    appId: '1:1092550034303:ios:9cdf25f8c35613cf97104a',
    messagingSenderId: '1092550034303',
    projectId: 'task-486b3',
    storageBucket: 'task-486b3.firebasestorage.app',
    iosBundleId: 'com.example.ideasnconcepts',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCfAhEh7FWoCnTr2eZvtl5MffPSXZeepIc',
    appId: '1:1092550034303:web:15cb0594837511b397104a',
    messagingSenderId: '1092550034303',
    projectId: 'task-486b3',
    authDomain: 'task-486b3.firebaseapp.com',
    storageBucket: 'task-486b3.firebasestorage.app',
    measurementId: 'G-YKWT11KKX5',
  );
}
