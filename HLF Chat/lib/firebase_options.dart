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
    apiKey: 'AIzaSyDlPERsUzgTXtwfYaagoFcL8W7_8f5OV9w',
    appId: '1:468000320017:web:3f673b77a49f821f7edfb0',
    messagingSenderId: '468000320017',
    projectId: 'hlf-chat-app',
    authDomain: 'hlf-chat-app.firebaseapp.com',
    storageBucket: 'hlf-chat-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCD5iZluWVqOyZ3UYY_h2y2xvJX9uM2VXA',
    appId: '1:468000320017:android:86a7dc620cc2eacb7edfb0',
    messagingSenderId: '468000320017',
    projectId: 'hlf-chat-app',
    storageBucket: 'hlf-chat-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-oSYR9rkZiPZK3t9RaE_EOVmQOnnc_mY',
    appId: '1:468000320017:ios:642fd70387586c2f7edfb0',
    messagingSenderId: '468000320017',
    projectId: 'hlf-chat-app',
    storageBucket: 'hlf-chat-app.appspot.com',
    iosClientId: '468000320017-cfe3qecsv7bs3ebilcaq6m546b8cjoa0.apps.googleusercontent.com',
    iosBundleId: 'com.example.hlfchat',
  );
}