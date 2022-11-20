import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/settingHeaderCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchBtnSettingsOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchSingleTextBtnOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class DataAndStorageSettingPage extends StatefulWidget {
  const DataAndStorageSettingPage({super.key});

  @override
  State<DataAndStorageSettingPage> createState() =>
      _DataAndStorageSettingPageState();
}

class _DataAndStorageSettingPageState extends State<DataAndStorageSettingPage> {
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
          "Data and storage",
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
                  title: "Manage storage",
                  description: "507.5 kB",
                  w: w,
                  ontap: () {}),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Media auto-download"),
              TitleDescriptionOptionCard(
                  title: "When using mobile data",
                  description: "Images, Audio",
                  w: w,
                  ontap: () {}),
              TitleDescriptionOptionCard(
                  title: "When using Wi-Fi",
                  description: "Images, Audio, Video, Documents",
                  w: w,
                  ontap: () {}),
              TitleDescriptionOptionCard(
                  title: "When roaming",
                  description: "None",
                  w: w,
                  ontap: () {}),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Media quality"),
              TitleDescriptionOptionCard(
                  title: "Sent media quality",
                  description: "Standard",
                  w: w,
                  ontap: () {}),
              const Padding(
                padding:
                    EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  "Sending high quality media will use more data",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white60),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Calls"),
              TitleDescriptionOptionCard(
                  title: "Use less data for calls",
                  description: "Never",
                  w: w,
                  ontap: () {}),
              const Padding(
                padding:
                    EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                child: Text(
                  "Use less data may improve calls on bad networks",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white60),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Poxy"),
              TitleDescriptionOptionCard(
                  title: "Use proxy", description: "Off", w: w, ontap: () {}),
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
