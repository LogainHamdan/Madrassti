import 'package:flutter/material.dart';

class BottomNavItemProvider with ChangeNotifier {
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  void toggleSelection(bool value) {
    _isSelected = value;
    notifyListeners();
  }
}
