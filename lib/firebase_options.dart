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
    apiKey: 'AIzaSyDbyf6s8LuCGzlsxHd00nHV7Cq-HeluETs',
    appId: '1:397501551685:web:64e941595af7e2e8413f2c',
    messagingSenderId: '397501551685',
    projectId: 'wallpaper-app-ahmed-ezzt',
    authDomain: 'wallpaper-app-ahmed-ezzt.firebaseapp.com',
    storageBucket: 'wallpaper-app-ahmed-ezzt.appspot.com',
    measurementId: 'G-QBL00NEP67',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmA7VaBego5yeOUbHrXCJcXF-I1hzVWgM',
    appId: '1:397501551685:android:804ef0b885a3c92b413f2c',
    messagingSenderId: '397501551685',
    projectId: 'wallpaper-app-ahmed-ezzt',
    storageBucket: 'wallpaper-app-ahmed-ezzt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgzZPZwctWjgCGxEgqE5-mXBssp4l-5T8',
    appId: '1:397501551685:ios:a699482763e54ee8413f2c',
    messagingSenderId: '397501551685',
    projectId: 'wallpaper-app-ahmed-ezzt',
    storageBucket: 'wallpaper-app-ahmed-ezzt.appspot.com',
    iosBundleId: 'com.ahmedezzt.wallpaperApp4k',
  );
}