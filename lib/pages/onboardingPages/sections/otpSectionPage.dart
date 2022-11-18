import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/homePage/homePagemodified.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:zupe/pages/onboardingPages/onboardingPages.dart';
import 'package:zupe/provider/onboardingProvider/onBoardingProvider.dart';

import 'package:zupe/widgets/otpFormField.dart';

class OtpSection extends StatefulWidget {
  OtpSection({
    super.key,
  });

  @override
  State<OtpSection> createState() => _OtpSectionState();
}

class _OtpSectionState extends State<OtpSection> {
  Country _selectedCountry = Country("India", "flags/ind.png", "IN", "+91");
  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showCountryPicker() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  TextEditingController phoneNumber = TextEditingController();
  String otpRecieved = '';
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Provider.of<OtpSectionProvider>(
      context,
    ).getOtpRequestSent
        ? otpRetrievalSection()
        : EnterNumberForm(w, context);
    ;
  }

  Container otpRetrievalSection() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(
                "zupe",
                style: TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w900,
                    fontSize: 42,
                    color: Color.fromRGBO(255, 255, 255, .7)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter the code we sent to",
                    style: TextStyle(
                        fontFamily: "Satoshi",
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "+91 ${phoneNumber.text.substring(0, 4)} ${phoneNumber.text.substring(4, 8)} ${phoneNumber.text.substring(8, 10)}",
                    style: const TextStyle(
                        fontFamily: "Satoshi",
                        fontSize: 24,
                        color: kFloatingbtnColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  EnterOTP(),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Call me instead \n(available in 01:00)",
                          style: TextStyle(
                              fontFamily: "Satoshi",
                              fontSize: 12,
                              color: Color.fromRGBO(104, 104, 104, 1),
                              fontWeight: FontWeight.w500),
                        ),
                        Text("Wrong number",
                            style: TextStyle(
                                fontFamily: "Satoshi",
                                fontSize: 12,
                                color: Color.fromRGBO(238, 218, 218, 1),
                                fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  if (Provider.of<OtpSectionProvider>(
                        context,
                      ).getOtpReceived.length ==
                      6)
                    const CircularProgressIndicator(
                      color: Color.fromRGBO(173, 255, 0, .85),
                    )
                ],
              ),
            ),
          ],
        ),
      );

  Container EnterNumberForm(double w, BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(),
            child: Text(
              "zupe",
              style: TextStyle(
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w900,
                  fontSize: 42,
                  color: Color.fromRGBO(255, 255, 255, .7)),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Get",
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      fontSize: 51,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "started",
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      fontSize: 51,
                      color: kFloatingbtnColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Enter your phone number",
            style: TextStyle(
                fontFamily: "Satoshi",
                fontSize: 21,
                color: Colors.white70,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              _showCountryPicker();
            },
            child: Container(
              height: 46,
              width: w - 96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: const RadialGradient(
                      radius: 7,
                      center: Alignment.topLeft,
                      // begin: Alignment.topLeft,
                      // end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(173, 255, 0, 1),
                        Color.fromRGBO(58, 62, 50, 1)
                      ])),
              child: Center(
                child: Container(
                  height: 42,
                  width: w - 100,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(19, 19, 19, .6),
                          offset: const Offset(
                            2,
                            5,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(21, 23, 22, 1)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      " ${_selectedCountry.name}",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontFamily: "Satoshi",
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: kNeonColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 46,
            width: w - 96,
            child: Row(
              children: [
                Container(
                  height: 46,
                  width: 72,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const RadialGradient(
                          radius: 2,
                          center: Alignment.topLeft,
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(173, 255, 0, 1),
                            Color.fromRGBO(58, 62, 50, 1)
                          ])),
                  child: Center(
                    child: Container(
                        height: 42,
                        width: 68,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(19, 19, 19, .6),
                                offset: Offset(
                                  2,
                                  5,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 4.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(21, 23, 22, 1)),
                        child: Center(
                          child: Text(
                            _selectedCountry.callingCode,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Satoshi",
                                color: Colors.white),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 46,
                  width: w - 188,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const RadialGradient(
                          radius: 5,
                          center: Alignment.topLeft,
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(173, 255, 0, 1),
                            Color.fromRGBO(58, 62, 50, 1)
                          ])),
                  child: Center(
                    child: Container(
                        height: 42,
                        width: w - 192,
                        padding: EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(19, 19, 19, .6),
                                offset: Offset(
                                  2,
                                  5,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 4.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(21, 23, 22, 1)),
                        child: Center(
                            child: SizedBox(
                          child: TextFormField(
                            controller: phoneNumber,
                            onChanged: (value) {
                              if (value.length == 10) {
                                Provider.of<OtpSectionProvider>(context,
                                        listen: false)
                                    .setMobileNumberEntered = true;
                              } else {
                                Provider.of<OtpSectionProvider>(context,
                                        listen: false)
                                    .setMobileNumberEntered = false;
                              }
                            },
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Satoshi",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white38),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Phone number"),
                          ),
                        ))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
