import 'package:flutter/material.dart';

class BGMController extends ChangeNotifier {
  bool _isBGMPlaying = true;

  // late String currentBGMPath;
  
  bool get isBGMPlaying => _isBGMPlaying;

  void toggleBGMPlaying() {
    _isBGMPlaying = !_isBGMPlaying;
    notifyListeners();
  }
  
  // BGMを一時停止するメソッド
  void pauseBGM() {
    _isBGMPlaying = false;
    notifyListeners();
  }

  // BGMを再開するメソッド
  void resumeBGM() {
    _isBGMPlaying = true;
    notifyListeners();
  }
}