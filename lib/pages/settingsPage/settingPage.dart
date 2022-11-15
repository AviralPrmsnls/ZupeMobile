import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/settingsPage/profilePage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: kchatPageColor,
        centerTitle: false,
        title: const Text(
          "Settings",
          style: TextStyle(
              fontSize: 22, fontFamily: "Satoshi", fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: kchatPageColor,
      body: Container(
        height: h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileCard(),
              SettingOptions(w, "Account", "", () {}, "account"),
              SettingOptionsWhite(w, "Linked Devices", "", () {}, "linked"),
              SettingOptions(w, "Appearance", "", () {}, "appearance"),
              SettingOptionsWhite(w, "Chats", "", () {}, "chat"),
              SettingOptionsWhite(w, "Stories", "", () {}, "stories"),
              SettingOptions(w, "Notifications", "", () {}, "notifications"),
              SettingOptions(w, "Privacy", "", () {}, "privacy"),
              SettingOptionsWhite(w, "Data and Storage", "", () {}, "data"),
              SettingOptions(w, "Payments", "", () {}, "payments"),
              SettingOptions(w, "Help", "", () {}, "help"),
              SettingOptions(w, "Invite your friends", "", () {}, "invite"),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center from() {
    return Center(
      child: Container(
        child: Column(
          children: const [
            Text(
              "from",
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: kGreyColor),
            ),
            Text(
              "Permissionless",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget SettingOptionsWhite(double w, String text, String description,
      Function()? ontap, String icon) {
    return Column(
      children: [
        const SizedBox(
          height: 0,
        ),
        InkWell(
          onTap: ontap,
          child: Container(
            height: 80,
            width: w,
            padding: EdgeInsets.only(left: 30, right: 20, bottom: 10),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/${icon}.png",
                    height: 32,
                    width: 32,
                    color: Colors.white54,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget SettingOptions(double w, String text, String description,
      Function()? ontap, String icon) {
    return Column(
      children: [
        const SizedBox(
          height: 0,
        ),
        InkWell(
          onTap: ontap,
          child: Container(
            height: 80,
            width: w,
            padding: EdgeInsets.only(left: 30, right: 20, bottom: 10),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/${icon}.png",
                    height: 32,
                    width: 32,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      if (text == "Payments")
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 4, top: 4),
                            decoration: BoxDecoration(
                                color: kNeonColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "BETA",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 8),
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget profileCard() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, bottom: 10, top: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  "assets/images/dp3.png",
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Lester ",
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "+91 9977 8564 10",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Satoshi",
                      color: Color.fromRGBO(114, 114, 114, 1),
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
