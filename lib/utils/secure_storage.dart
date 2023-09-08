
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageNotifier {
  /// Making it Singleton Design Pattern
  SecureStorageNotifier._privateConstructor();
  static final SecureStorageNotifier instance = SecureStorageNotifier._privateConstructor();

  final secureStorage = const FlutterSecureStorage();


  Future clearAllSecureStorage() async{
    /// Delete all
    await secureStorage.deleteAll();
  }
}