import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _tempEmail = '';
  String get tempEmail => _tempEmail;
  set tempEmail(String value) {
    _tempEmail = value;
  }

  String _tempPassword = '';
  String get tempPassword => _tempPassword;
  set tempPassword(String value) {
    _tempPassword = value;
  }
}
