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
    apiKey: 'AIzaSyCQAfKOcWsVW309J3in4KXgqmfg0j-h2XA',
    appId: '1:1091028081934:web:d399e698260ec9f8964b5f',
    messagingSenderId: '1091028081934',
    projectId: 'we-help-app-d9b17',
    authDomain: 'we-help-app-d9b17.firebaseapp.com',
    storageBucket: 'we-help-app-d9b17.appspot.com',
    measurementId: 'G-XQ218XQSBY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlhbiVNY-d9KWRjxnxSmFJzM9zl4EkkLg',
    appId: '1:1091028081934:android:b10fec2d8e93ba0a964b5f',
    messagingSenderId: '1091028081934',
    projectId: 'we-help-app-d9b17',
    storageBucket: 'we-help-app-d9b17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDx4UpgEQnP2mOxW8HNG8i-OM7TUNVR1WY',
    appId: '1:1091028081934:ios:92db3f07fecbc5e5964b5f',
    messagingSenderId: '1091028081934',
    projectId: 'we-help-app-d9b17',
    storageBucket: 'we-help-app-d9b17.appspot.com',
    iosClientId: '1091028081934-v35o1pbl9bosc4sdoq9kp7dp08jmducu.apps.googleusercontent.com',
    iosBundleId: 'com.example.weHelpApp',
  );
}
