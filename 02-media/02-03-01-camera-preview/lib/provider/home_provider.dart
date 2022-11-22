import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String? imagePath;
  /// todo-click-04: create a image variable so save image information
  XFile? imageFile;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  /// todo-click-04-02: create a function to save a value
  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }
}
