import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/settingsPage/optionPages/InviteSettingPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/accountPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/appearancePage.dart';
import 'package:zupe/pages/settingsPage/optionPages/chatSettingPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/dataAndStorageSettingPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/helpSettingPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/linkedDevicesPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/notificationSettingPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/paymentSettingPage.dart';
import 'package:zupe/pages/settingsPage/optionPages/privacySettingPage.dart';

import 'package:zupe/pages/settingsPage/optionPages/profilePage.dart';
import 'package:zupe/pages/settingsPage/optionPages/storiesSettingPage.dart';

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
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: kFloatingbtnColor,
          ),
        ),
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
              SettingOptions(w, "Account", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                });
              }, "account"),
              SettingOptionsWhite(w, "Linked Devices", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LinkedDevicesPage()),
                  );
                });
              }, "linked"),
              SettingOptions(w, "Appearance", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppearancePage()),
                  );
                });
              }, "appearance"),
              SettingOptionsWhite(w, "Chats", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatSettingPage()),
                  );
                });
              }, "chat"),
              SettingOptionsWhite(w, "Stories", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoriesSettingPage()),
                  );
                });
              }, "stories"),
              SettingOptions(w, "Notifications", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationSettingPage()),
                  );
                });
              }, "notifications"),
              SettingOptions(w, "Privacy", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacySettingPage()),
                  );
                });
              }, "privacy"),
              SettingOptionsWhite(w, "Data and Storage", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataAndStorageSettingPage()),
                  );
                });
              }, "data"),
              SettingOptions(w, "Payments", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentSettingPage()),
                  );
                });
              }, "payments"),
              SettingOptions(w, "Help", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpSettingPage()),
                  );
                });
              }, "help"),
              SettingOptions(w, "Invite your friends", "", () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InviteSettingPage()),
                  );
                });
              }, "invite"),
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
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        });
      },
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
