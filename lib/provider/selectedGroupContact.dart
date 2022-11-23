import 'package:flutter/material.dart';

class SelectGroupContactProvider extends ChangeNotifier {
  Set<String> _selectContactForGroup = {};

  Set<String> get getContactForGroup => _selectContactForGroup;

  set setContactForGroup(String selectContactForGroup) {
    _selectContactForGroup.add(selectContactForGroup);
    notifyListeners();
  }

  set removeContactFromGroup(String removeContactForGroup) {
    _selectContactForGroup.remove(removeContactForGroup);
    notifyListeners();
  }

  Set<String> _selectPhoneForGroup = {};

  Set<String> get getPhoneForGroup => _selectPhoneForGroup;

  set setPhoneForGroup(String selectPhoneForGroup) {
    _selectPhoneForGroup.add(selectPhoneForGroup);
    notifyListeners();
  }

  set removePhoneForGroup(String removePhoneForGroup) {
    _selectPhoneForGroup.remove(removePhoneForGroup);
    notifyListeners();
  }
}
