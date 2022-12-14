import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zupe/provider/onboardingProvider/onBoardingProvider.dart';
import 'package:zupe/service/apiService.dart';

import '../pages/onboardingPages/onboardingPages.dart';

class EnterOTP extends StatefulWidget {
  EnterOTP({
    super.key,
  });

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

ApiService apiService = ApiService();
getOtp(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  Provider.of<OtpSectionProvider>(context, listen: false).setOtpReceived =
      firstDigit.text +
          secondDigit.text +
          thirdDigit.text +
          fourthDigit.text +
          fifthDigit.text +
          sixthDigit.text;

  var result = await apiService.verifyOtp(
      Provider.of<PhomeNumberSectionProvider>(context, listen: false)
          .getPhoneNumber,
      Provider.of<OtpSectionProvider>(context, listen: false).getOtpReceived);
  if (result == 201) {
    prefs.setString(
        "UserPhone",
        Provider.of<PhomeNumberSectionProvider>(context, listen: false)
            .getPhoneNumber);
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  } else {
    Provider.of<OtpSectionProvider>(context, listen: false)
        .setMobileNumberEntered = false;
    Provider.of<PhomeNumberSectionProvider>(context, listen: false)
        .setPhoneNumber = "";
    Provider.of<OtpSectionProvider>(context, listen: false).setOtpRequestSent =
        false;
    Provider.of<CaptchaSectionProvider>(context, listen: false).setCaptcha = "";
    Provider.of<CaptchaSectionProvider>(context, listen: false).setCaptcScreen =
        false;

    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  }
}

String Otp = '';

TextEditingController firstDigit = TextEditingController();
TextEditingController secondDigit = TextEditingController();
TextEditingController thirdDigit = TextEditingController();

TextEditingController fourthDigit = TextEditingController();
TextEditingController fifthDigit = TextEditingController();
TextEditingController sixthDigit = TextEditingController();

class _EnterOTPState extends State<EnterOTP> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPDigitTextFieldBox(
                first: true,
                last: false,
                digitcontroller: firstDigit,
              ),
              OTPDigitTextFieldBox(
                first: false,
                last: false,
                digitcontroller: secondDigit,
              ),
              OTPDigitTextFieldBox(
                first: false,
                last: false,
                digitcontroller: thirdDigit,
              ),
              Text(
                "-",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w900,
                    fontSize: 40),
              ),
              OTPDigitTextFieldBox(
                first: false,
                last: false,
                digitcontroller: fourthDigit,
              ),
              OTPDigitTextFieldBox(
                first: false,
                last: false,
                digitcontroller: fifthDigit,
              ),
              OTPDigitTextFieldBox(
                first: false,
                last: true,
                digitcontroller: sixthDigit,
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  OTPDigitTextFieldBox({
    super.key,
    required this.first,
    required this.last,
    required this.digitcontroller,
  });

  final bool first;
  final bool last;

  TextEditingController digitcontroller;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: const RadialGradient(radius: 1.5, center: Alignment.topLeft,
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(173, 255, 0, 1),
                Color.fromRGBO(58, 62, 50, 1)
              ])),
      child: Center(
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(19, 19, 19, .6),
                  offset: const Offset(
                    2,
                    5,
                  ),
                  blurRadius: 30.0,
                  spreadRadius: 20.0,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              color: Color.fromRGBO(21, 23, 22, 1)),
          child: Padding(
            padding: EdgeInsets.only(top: 00),
            child: Center(
              child: TextFormField(
                controller: digitcontroller,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autofocus: true,
                onFieldSubmitted: (value) {
                  if (last) {
                    if (value.length == 1) {
                      getOtp(context);
                    }
                  }
                },
                onChanged: (value) {
                  if (value.length == 1 && last == false) {
                    FocusScope.of(context).nextFocus();
                  }
                  if (value.length == 0 && first == false) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                showCursor: true,
                cursorColor: Colors.white,
                readOnly: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Satoshi",
                    color: Color.fromRGBO(255, 255, 255, .8),
                    fontSize: 18),
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  // contentPadding: EdgeInsets.all(0),
                  contentPadding:
                      EdgeInsets.only(left: 10, bottom: 7, top: 0, right: 10),
                  counter: Offstage(),
                  enabledBorder: InputBorder.none,

                  focusedBorder: InputBorder.none,
                  hintText: "*",
                  hintStyle: TextStyle(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
