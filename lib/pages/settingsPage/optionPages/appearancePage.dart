import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/redTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/settingHeaderCard.dart';
import 'package:zupe/widgets/settingPageWidgets/singleTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchBtnSettingsOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  bool isPinReminder = true;
  bool isRegistrationLock = false;
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
          "Appearance",
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
                w: w,
                ontap: () {},
                title: "Theme",
                description: "System default",
              ),
              SingleTitleOptionCard(
                  text: "Chat color & wallpaper", ontap: () {}, w: w),
              TitleDescriptionOptionCard(
                w: w,
                ontap: () {},
                title: "Message font size",
                description: "Normal",
              ),
              TitleDescriptionOptionCard(
                w: w,
                ontap: () {},
                title: "Language",
                description: "System default",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
