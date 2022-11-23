import 'package:flutter/material.dart';

class OtpSectionProvider extends ChangeNotifier {
  bool _isMobileNumberEntered = false;

  bool get getMobileNumberEntered => _isMobileNumberEntered;

  set setMobileNumberEntered(bool isMobileNumberEntered) {
    _isMobileNumberEntered = isMobileNumberEntered;
    notifyListeners();
  }

  bool _isPhoneTextField = false;

  bool get getPhoneTextField => _isPhoneTextField;

  set setPhoneTextField(bool isPhoneTextField) {
    _isPhoneTextField = isPhoneTextField;
    notifyListeners();
  }

  bool _isOtpRequestSent = false;

  bool get getOtpRequestSent => _isOtpRequestSent;

  set setOtpRequestSent(bool isOtpRequestSent) {
    _isOtpRequestSent = isOtpRequestSent;
    notifyListeners();
  }

  String _OtpReceived = "";

  String get getOtpReceived => _OtpReceived;

  set setOtpReceived(String OtpReceived) {
    _OtpReceived = OtpReceived;
    notifyListeners();
  }
}

class PhomeNumberSectionProvider extends ChangeNotifier {
  String _phoneNumber = "";

  String get getPhoneNumber => _phoneNumber;

  set setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}

class CaptchaSectionProvider extends ChangeNotifier {
  String _Captcha = "";

  String get getCaptcha => _Captcha;

  set setCaptcha(String Captcha) {
    _Captcha = Captcha;
    notifyListeners();
  }

  bool _isCaptcScreen = false;

  bool get getCaptcScreen => _isCaptcScreen;

  set setCaptcScreen(bool isCaptcScreen) {
    _isCaptcScreen = isCaptcScreen;
    notifyListeners();
  }
}

class ProfileSectionProvider extends ChangeNotifier {
  String _firstName = "";

  String get getfirstName => _firstName;

  set setfirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  String _base64Dp = "";

  String get getbase64Dp => _base64Dp;

  set setbase64Dp(String base64Dp) {
    _base64Dp = base64Dp;
    notifyListeners();
  }

  String _userName = "";

  String get getuserName => _userName;

  set setuserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  String _lastName = "";

  String get getlastName => _lastName;

  set setlastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }
}

class PinSectionProvider extends ChangeNotifier {
  String _Pin = "";

  String get getPin => _Pin;

  set setPin(String Pin) {
    _Pin = Pin;
    notifyListeners();
  }
}
