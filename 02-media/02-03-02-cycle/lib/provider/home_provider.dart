import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String? imagePath;

  XFile? imageFile;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }
}
