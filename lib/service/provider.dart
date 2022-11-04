import 'package:flutter/material.dart';

class TabBarProvider with ChangeNotifier {
  int _selectPage = 1;

  int get selectPage => _selectPage;

  set SelectPage(int selectPage) {
    _selectPage = selectPage;
    notifyListeners();
  }
}
