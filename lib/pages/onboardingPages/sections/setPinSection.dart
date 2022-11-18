import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/provider/onboardingProvider/onBoardingProvider.dart';

class SetPinSection extends StatefulWidget {
  SetPinSection({
    Key? key,
  }) : super(key: key);

  @override
  State<SetPinSection> createState() => _SetPinSectionState();
}

class _SetPinSectionState extends State<SetPinSection> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Text(
        "zupe",
        style: TextStyle(
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w900,
            fontSize: 42,
            color: Color.fromRGBO(255, 255, 255, .7)),
      ),
      SizedBox(
        height: h * .06,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Create your",
            style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "PIN",
            style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: kFloatingbtnColor),
          ),
        ],
      ),
      const SizedBox(
        height: 6,
      ),
      SizedBox(
        height: 100,
        child: (Provider.of<PinSectionProvider>(context).getPin.length == 0)
            ? const Text(
                "Confirm your PIN",
                style: TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color.fromRGBO(104, 104, 104, 1)),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: const [
                    Text(
                      "PINs keep information stored with Zupe encrypted so only you can access it. Your profile, settings, and contacts will restore when you reinstall. You won’t need your PIN to open the app. Learn more",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Color.fromRGBO(104, 104, 104, 1)),
                    ),
                    Text(
                      "Learn more",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: kFloatingbtnColor),
                    )
                  ],
                ),
              ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        width: w * .80,
        height: 40,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kFloatingbtnColor))),
        child: Center(
          child: TextFormField(
            onChanged: (value) {
              Provider.of<PinSectionProvider>(context, listen: false).setPin =
                  value;
            },
            controller: pinController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            obscureText: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25, fontFamily: "Satoshi", color: kFloatingbtnColor),
            cursorColor: kFloatingbtnColor,
            decoration: const InputDecoration(
                hintText: '',
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
      ),
      if (Provider.of<PinSectionProvider>(context).getPin.length > 0 &&
          Provider.of<PinSectionProvider>(context).getPin.length <= 4)
        Column(
          children: const [
            SizedBox(
              height: 25,
            ),
            Text(
              "PIN must be at least 4 digits",
              style: TextStyle(
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromRGBO(215, 211, 211, 1)),
            ),
          ],
        ),
    ]));
  }
}
