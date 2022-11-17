import 'package:flutter/material.dart';

class OtpSectionProvider extends ChangeNotifier {
  bool _isMobileNumberEntered = false;

  bool get getMobileNumberEntered => _isMobileNumberEntered;

  set setMobileNumberEntered(bool isMobileNumberEntered) {
    _isMobileNumberEntered = isMobileNumberEntered;
    notifyListeners();
  }

  bool _isOtpRequestSent = false;

  bool get getOtpRequestSent => _isOtpRequestSent;

  set setOtpRequestSent(bool isOtpRequestSent) {
    _isOtpRequestSent = isOtpRequestSent;
    notifyListeners();
  }
}
