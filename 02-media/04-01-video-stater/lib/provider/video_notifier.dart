import "package:flutter/material.dart";

class VideoNotifier extends ChangeNotifier {
  bool _isPlay = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  bool get isPlay => _isPlay;
  set isPlay(bool value) {
    _isPlay = value;
    notifyListeners();
  }

  Duration get duration => _duration;
  set duration(Duration value) {
    _duration = value;
    notifyListeners();
  }

  Duration get position => _position;
  set position(Duration value) {
    _position = value;
    notifyListeners();
  }
}
