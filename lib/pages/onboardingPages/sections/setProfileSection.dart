import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/provider/onboardingProvider/onBoardingProvider.dart';

class SetProfileSection extends StatefulWidget {
  SetProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  State<SetProfileSection> createState() => _SetProfileSectionState();
}

class _SetProfileSectionState extends State<SetProfileSection> {
  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

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
      const SizedBox(
        height: 25,
      ),
      const Text(
        "Set up Your",
        style: TextStyle(
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromRGBO(255, 255, 255, 1)),
      ),
      const Text(
        "Profile",
        style: TextStyle(
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w700,
            fontSize: 45,
            color: kFloatingbtnColor),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        "Profiles are visible to people you message,",
        style: TextStyle(
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w700,
            fontSize: 8,
            color: Color.fromRGBO(104, 104, 104, 1)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "contacts, and groups.",
            style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w700,
                fontSize: 8,
                color: Color.fromRGBO(104, 104, 104, 1)),
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            "Learn more.",
            style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500,
                fontSize: 8,
                color: kFloatingbtnColor),
          ),
        ],
      ),
      SizedBox(
        height: h * .045,
      ),
      Stack(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Color.fromRGBO(208, 208, 208, 1),
                borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Image.asset(
                "assets/icons/profile.png",
                color: Color.fromRGBO(69, 69, 69, 1),
                height: 35,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(34, 34, 34, 1),
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: Image.asset(
                  "assets/icons/camera.png",
                  height: 11,
                  width: 13,
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: h * .045,
      ),
      Container(
        height: 46,
        width: w - 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(58, 62, 50, 1),
                  Color.fromRGBO(173, 255, 0, 1),
                ])),
        child: Center(
          child: Container(
              height: 42,
              width: w - 84,
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
                  onChanged: (value) {
                    setState(() {
                      Provider.of<ProfileSectionProvider>(context,
                              listen: false)
                          .setfirstName = value;
                    });
                  },
                  controller: firstName,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
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
                      hintText: "First name (required)"),
                ),
              ))),
        ),
      ),
      SizedBox(
        height: h * .015,
      ),
      Container(
        height: 46,
        width: w - 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(58, 62, 50, 1),
                  Color.fromRGBO(173, 255, 0, 1),
                ])),
        child: Center(
          child: Container(
              height: 42,
              width: w - 84,
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
                  onChanged: (value) {
                    Provider.of<ProfileSectionProvider>(context, listen: false)
                        .setlastName = value;
                  },
                  controller: lastName,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
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
                      hintText: "Last name (optional)"),
                ),
              ))),
        ),
      ),
    ]));
  }
}
