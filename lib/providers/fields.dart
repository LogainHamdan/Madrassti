import 'package:flutter/cupertino.dart';

class FieldProvider with ChangeNotifier {
  bool _isEnabled = false;
  String _buttonText;

  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController emailRegController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passLoginController = TextEditingController();
  final TextEditingController passRegController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();
  final TextEditingController searchHomeController = TextEditingController();
  final TextEditingController searchChatController = TextEditingController();

  FieldProvider(this._buttonText);

  bool get isEnabled => _isEnabled;
  String get buttonText => _buttonText;

  void toggleButton(bool value) {
    _isEnabled = value;
    notifyListeners();
  }

  void updateText(String newText) {
    _buttonText = newText;
    notifyListeners();
  }

  bool validateForm() {
    bool isValid = true;

    if (firstNameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        userNameController.text.isEmpty ||
        emailLoginController.text.isEmpty ||
        emailRegController.text.isEmpty ||
        numberController.text.isEmpty ||
        passLoginController.text.isEmpty ||
        passRegController.text.isEmpty ||
        searchHomeController.text.isEmpty ||
        searchChatController.text.isEmpty ||
        confPassController.text.isEmpty ||
        passRegController.text != confPassController.text) {
      isValid = false;
    }

    toggleButton(isValid); // Enable/Disable button based on validation
    return isValid;
  }

  // Method to clear all fields
  void clearFields() {
    firstNameController.clear();
    surnameController.clear();
    userNameController.clear();
    emailRegController.clear();
    emailLoginController.clear();
    numberController.clear();
    passLoginController.clear();
    passRegController.clear();
    confPassController.clear();
    searchHomeController.clear();
    searchChatController.clear();

    toggleButton(false); // Disable the button after clearing
    notifyListeners(); // Notify listeners to rebuild UI if necessary
  }
}
