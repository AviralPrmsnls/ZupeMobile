import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/settingHeaderCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchBtnSettingsOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchSingleTextBtnOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class PrivacySettingPage extends StatefulWidget {
  const PrivacySettingPage({super.key});

  @override
  State<PrivacySettingPage> createState() => _PrivacySettingPageState();
}

class _PrivacySettingPageState extends State<PrivacySettingPage> {
  bool isReadReceipts = true;
  bool isTypingIndicators = false;
  bool isTimer = false;
  bool isScreenLock = false;
  bool isScreenSecurity = false;
  bool isIncognitoKeyboard = false;
  bool isPaymentLock = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: kchatPageColor,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: kFloatingbtnColor,
          ),
        ),
        title: const Text(
          "Privacy",
          style: TextStyle(
              fontSize: 22, fontFamily: "Satoshi", fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: kAppBarPrimaryColor,
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleDescriptionOptionCard(
                  title: "Blocked",
                  description: "0 Contacts",
                  w: w,
                  ontap: () {}),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Messaging"),
              SwitchBtnSettingsOptionCard(
                header: "Read Reciepts",
                description:
                    "if read receipts are disabled, you won't be able to see read receipts from others.",
                isSelect: isReadReceipts,
                ontap: () {
                  setState(() {
                    isReadReceipts = !isReadReceipts;
                  });
                },
              ),
              SwitchBtnSettingsOptionCard(
                header: "Typing indicators",
                description:
                    "if typing indicators are disabled, you won't be able see typing idicators from others",
                isSelect: isTypingIndicators,
                ontap: () {
                  setState(() {
                    isTypingIndicators = !isTypingIndicators;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Disappearing messages"),
              SwitchBtnSettingsOptionCard(
                header: "Default timer for new chats",
                description:
                    "Set a default disappearing message timer for all new chats started by you",
                isSelect: isTimer,
                ontap: () {
                  setState(() {
                    isTimer = !isTimer;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "App security"),
              SwitchBtnSettingsOptionCard(
                header: "Screen lock",
                description:
                    "Lock Zupe access with Android screen lock or fingerprint",
                isSelect: isScreenLock,
                ontap: () {
                  setState(() {
                    isScreenLock = !isScreenLock;
                  });
                },
              ),
              TitleDescriptionOptionCard(
                  title: "Screen lock inactivity timeout",
                  description: "None",
                  w: w,
                  ontap: () {}),
              SwitchBtnSettingsOptionCard(
                header: "Screen security",
                description:
                    "Block screenshots in the recent list and inside the app",
                isSelect: isScreenSecurity,
                ontap: () {
                  setState(() {
                    isScreenSecurity = !isScreenSecurity;
                  });
                },
              ),
              SwitchBtnSettingsOptionCard(
                header: "Incognito Keyboard",
                description:
                    "Request keyboard to disable personalized learning",
                isSelect: isIncognitoKeyboard,
                ontap: () {
                  setState(() {
                    isIncognitoKeyboard = !isIncognitoKeyboard;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Payments"),
              SwitchBtnSettingsOptionCard(
                header: "Payment lock",
                description:
                    "Request keyboard to disable personalized learning",
                isSelect: isPaymentLock,
                ontap: () {
                  setState(() {
                    isPaymentLock = !isPaymentLock;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              TitleDescriptionOptionCard(
                  title: "Advanced",
                  description:
                      "Zupe messages and calls, always relay calls, and sealed sender",
                  w: w,
                  ontap: () {}),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
