import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDVAtaynZ70nC304KNuqPsizBG8Wzom9V0',
    appId: '1:810628528302:web:7c0dfb10bde272b9bb553f',
    messagingSenderId: '810628528302',
    projectId: 'learning-by-googling',
    authDomain: 'learning-by-googling.firebaseapp.com',
    databaseURL: 'https://learning-by-googling-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'learning-by-googling.firebasestorage.app',
    measurementId: 'G-DKH678VDNY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDd_RthmyBXVYjPDogXX73cBGN9ed4Fdkw',
    appId: '1:810628528302:android:1638e4e0e626acb0bb553f',
    messagingSenderId: '810628528302',
    projectId: 'learning-by-googling',
    databaseURL: 'https://learning-by-googling-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'learning-by-googling.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCigGsN-brmdC7a7j_GvO6X8aXNP9mNZ1U',
    appId: '1:810628528302:ios:aba0656228599e03bb553f',
    messagingSenderId: '810628528302',
    projectId: 'learning-by-googling',
    databaseURL: 'https://learning-by-googling-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'learning-by-googling.firebasestorage.app',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCigGsN-brmdC7a7j_GvO6X8aXNP9mNZ1U',
    appId: '1:810628528302:ios:aba0656228599e03bb553f',
    messagingSenderId: '810628528302',
    projectId: 'learning-by-googling',
    databaseURL: 'https://learning-by-googling-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'learning-by-googling.firebasestorage.app',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDVAtaynZ70nC304KNuqPsizBG8Wzom9V0',
    appId: '1:810628528302:web:aeb3b83b0a2f8d0abb553f',
    messagingSenderId: '810628528302',
    projectId: 'learning-by-googling',
    authDomain: 'learning-by-googling.firebaseapp.com',
    databaseURL: 'https://learning-by-googling-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'learning-by-googling.firebasestorage.app',
    measurementId: 'G-CKC5QKGYRV',
  );
}
