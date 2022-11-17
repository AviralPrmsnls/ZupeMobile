import 'package:flutter/material.dart';

class StoriesProvider extends ChangeNotifier {
  bool _isStoriesPageOpen = false;

  bool get getStoriesPageOpen => _isStoriesPageOpen;

  set setStoriesPageOpen(bool isStoriesPageOpen) {
    _isStoriesPageOpen = isStoriesPageOpen;
    notifyListeners();
  }
}
