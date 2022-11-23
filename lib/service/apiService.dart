import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiConstants {
  static String baseUrl = 'https://zupe-the-last.azurewebsites.net/';
  static String userRegisterEndpoint = 'v1/register/';
  static String userOtpVerificationEndpoint = 'v1/register/';
}

class ApiService {
  Future getOtpWhenSignIn(String phoneNumber, String captcha) async {
    Map<String, dynamic> data = {
      'captcha': captcha,
      'use_voice': false,
    };
    var body = jsonEncode(data);
    try {
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.userRegisterEndpoint +
          phoneNumber);

      print(url);
      print(captcha);
      var response = await http.post(url, body: body);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        return response.statusCode;
      }
    } catch (e) {
      print("error");
      print(e.toString());
    }
  }

  Future verifyOtp(String phoneNumber, String otp) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl +
          ApiConstants.userRegisterEndpoint +
          phoneNumber +
          '/verify/' +
          otp);

      print(url);

      var response = await http.post(
        url,
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        return response.statusCode;
      }
    } catch (e) {
      print("error");
      print(e.toString());
    }
  }
}
