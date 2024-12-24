import 'package:flutter/material.dart';

class CustomStackProvider with ChangeNotifier {
  Image _image;
  String _title;

  CustomStackProvider(this._image, this._title);

  Image get image => _image;
  String get title => _title;

  void updateImageAndTitle(Image newImage, String newTitle) {
    _image = newImage;
    _title = newTitle;
    notifyListeners();
  }
}
