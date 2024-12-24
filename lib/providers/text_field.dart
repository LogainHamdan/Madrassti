import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  String _text = '';
  String? _error;

  String get text => _text;
  String? get error => _error;

  void updateText(String value) {
    _text = value;
    _error = null; // Reset the error when the text is updated
    notifyListeners();
  }

  void validateText(String value, String? Function(String?) validator) {
    _error = validator(value);
    notifyListeners();
  }
}
