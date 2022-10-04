import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String? imagePath;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }
}
