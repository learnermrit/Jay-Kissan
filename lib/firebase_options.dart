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
    apiKey: 'AIzaSyCq0z4jfuag89-5QZj78AOTm2_FlPNu65U',
    appId: '1:933502073142:web:41be44917f8d042bf89b97',
    messagingSenderId: '933502073142',
    projectId: 'jay-kissan-ca961',
    authDomain: 'jay-kissan-ca961.firebaseapp.com',
    storageBucket: 'jay-kissan-ca961.appspot.com',
    measurementId: 'G-E3S6QE9P86',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYDGoa3WM1m3HbiYNCzzDBhFfLo9uNX0I',
    appId: '1:933502073142:android:b4393b097e494556f89b97',
    messagingSenderId: '933502073142',
    projectId: 'jay-kissan-ca961',
    storageBucket: 'jay-kissan-ca961.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkNoJfLownxq1eFjlj7gRYvnZh5MEdZeo',
    appId: '1:933502073142:ios:39446ff91755e404f89b97',
    messagingSenderId: '933502073142',
    projectId: 'jay-kissan-ca961',
    storageBucket: 'jay-kissan-ca961.appspot.com',
    androidClientId: '933502073142-j33q05l8ca266r5lmkto76molbckep9a.apps.googleusercontent.com',
    iosClientId: '933502073142-f4f2ui7c68977emggg683qog11i00ce0.apps.googleusercontent.com',
    iosBundleId: 'com.example.jayKissan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCkNoJfLownxq1eFjlj7gRYvnZh5MEdZeo',
    appId: '1:933502073142:ios:39446ff91755e404f89b97',
    messagingSenderId: '933502073142',
    projectId: 'jay-kissan-ca961',
    storageBucket: 'jay-kissan-ca961.appspot.com',
    androidClientId: '933502073142-j33q05l8ca266r5lmkto76molbckep9a.apps.googleusercontent.com',
    iosClientId: '933502073142-f4f2ui7c68977emggg683qog11i00ce0.apps.googleusercontent.com',
    iosBundleId: 'com.example.jayKissan',
  );
}
