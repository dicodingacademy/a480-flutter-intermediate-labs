import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' show XFile;

class HomeProvider extends ChangeNotifier {
  String? imagePath;
  /// todo-gallery-04: create a image variable so save image information
  XFile? imageFile;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  /// todo-gallery-04-02: create a function to save a value
  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }
}
