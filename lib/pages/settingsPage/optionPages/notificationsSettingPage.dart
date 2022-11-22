import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/redTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/settingHeaderCard.dart';
import 'package:zupe/widgets/settingPageWidgets/singleTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchBtnSettingsOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchSingleTextBtnOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class NotificationsSettingPage extends StatefulWidget {
  const NotificationsSettingPage({super.key});

  @override
  State<NotificationsSettingPage> createState() => _NotificationsSettingPageState();
}

class _NotificationsSettingPageState extends State<NotificationsSettingPage> {
  bool  isCallNotifications  = true;
 bool  isCallVibrate = true;
  bool isEnterKeySends = false;
  bool  isInChatSound = false;
  bool isNotifications = false;

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
          "Notifications",
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
               SettingHeaderCard(text: "Messages"),
                   SwitchSingleBtnSettingsOptionCard(
                header: "Notifications",
                isSelect: isNotifications,
                ontap: () {
                  setState(() {
                    isNotifications = !isNotifications;
                  });
                },
              ),
                 TitleDescriptionOptionCard(
                  title: "Customize",
                  description: "Change sound and vibration",
                  w: w,
                  ontap: () {}),

                   SwitchSingleBtnSettingsOptionCard(
                header: "In-chat sounds",
                isSelect: isInChatSound,
                ontap: () {
                  setState(() {
                    isInChatSound = !isInChatSound;
                  });
                },
              ),
                   TitleDescriptionOptionCard(
                  title: "Repeat alerts",
                  description: "Never",
                  w: w,
                  ontap: () {}),
                  TitleDescriptionOptionCard(
                  title: "Show",
                  description: "Name and message",
                  w: w,
                  ontap: () {}),
                      const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Calls"),
                       SwitchSingleBtnSettingsOptionCard(
                header: "Notifications",
                isSelect: isCallNotifications,
                ontap: () {
                  setState(() {
                    isCallNotifications = !isCallNotifications;
                  });
                },
              ),
          
                 TitleDescriptionOptionCard(
                  title: "Ringtone",
                  description: "Default(MiRemix)",
                  w: w,
                  ontap: () {}),
                           SwitchSingleBtnSettingsOptionCard(
                header: "Vibrate",
                isSelect: isCallVibrate,
                ontap: () {
                  setState(() {
                    isCallVibrate = !isCallVibrate;
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
            
              SettingHeaderCard(text: "Notofication profiles"),
                TitleDescriptionOptionCard(
                  title: "Profiles",
                  description: "Create a profile to receive notifications only from people and groups you choose",
                  w: w,
                  ontap: () {}),
                   
              SettingHeaderCard(text: "Notification profiles"),
            ],
          ),
        ),
      ),
    );
  }
}
