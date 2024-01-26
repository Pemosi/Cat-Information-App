import 'package:flutter/material.dart';

class BGMController extends ChangeNotifier {
  bool _isBGMPlaying = true;
  
  bool get isBGMPlaying => _isBGMPlaying;

  void toggleBGMPlaying() {
    _isBGMPlaying = !_isBGMPlaying;
    notifyListeners();
  }
}