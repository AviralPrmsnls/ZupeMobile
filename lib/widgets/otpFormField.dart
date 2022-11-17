import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterOTP extends StatefulWidget {
  EnterOTP({super.key, required this.otp});
  String otp;
  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  getOtp() {
    setState(() {
      widget.otp = firstDigit.text +
          secondDigit.text +
          thirdDigit.text +
          fourthDigit.text +
          fifthDigit.text +
          sixthDigit.text;
    });
    print("this is otp ${widget.otp}");
  }

  TextEditingController firstDigit = TextEditingController();
  TextEditingController secondDigit = TextEditingController();
  TextEditingController thirdDigit = TextEditingController();

  TextEditingController fourthDigit = TextEditingController();
  TextEditingController fifthDigit = TextEditingController();
  TextEditingController sixthDigit = TextEditingController();
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
                getOtp: getOtp(),
                first: true,
                last: false,
                digitcontroller: firstDigit,
              ),
              OTPDigitTextFieldBox(
                getOtp: getOtp(),
                first: false,
                last: false,
                digitcontroller: secondDigit,
              ),
              OTPDigitTextFieldBox(
                getOtp: getOtp(),
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
                getOtp: getOtp(),
                first: false,
                last: false,
                digitcontroller: fourthDigit,
              ),
              OTPDigitTextFieldBox(
                getOtp: getOtp(),
                first: false,
                last: false,
                digitcontroller: fifthDigit,
              ),
              OTPDigitTextFieldBox(
                getOtp: getOtp(),
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
  OTPDigitTextFieldBox(
      {super.key,
      required this.first,
      required this.last,
      required this.digitcontroller,
      required this.getOtp});

  final bool first;
  final bool last;
  dynamic getOtp;
  TextEditingController digitcontroller;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: w * .11,
      width: w * .11,
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
          height: (w * .11) - 4,
          width: (w * .11) - 4,
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autofocus: true,
                onChanged: (value) {
                  if (last) {
                    if (digitcontroller.text.length == 1) print("object");
                  }
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
                    fontSize: 21),
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  // contentPadding: EdgeInsets.all(0),
                  contentPadding:
                      EdgeInsets.only(left: 14, bottom: 7, top: 0, right: 15),
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
