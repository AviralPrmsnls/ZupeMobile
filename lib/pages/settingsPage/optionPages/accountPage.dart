import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/redTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/settingHeaderCard.dart';
import 'package:zupe/widgets/settingPageWidgets/singleTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchBtnSettingsOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          "Account",
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
              SettingHeaderCard(text: "Zupe PIN"),
              SingleTitleOptionCard(
                  text: "Change your PIN", ontap: () {}, w: w),
              SwitchBtnSettingsOptionCard(
                header: "PIN reminders",
                description: "You'll be asked less frequently \nover time.",
                isSelect: isPinReminder,
                ontap: () {
                  setState(() {
                    isPinReminder = !isPinReminder;
                  });
                },
              ),
              SwitchBtnSettingsOptionCard(
                header: "Registration Lock",
                description:
                    "Require your Zupe PIN to register your phone number with Zupe again",
                isSelect: isRegistrationLock,
                ontap: () {
                  setState(() {
                    isRegistrationLock = !isRegistrationLock;
                  });
                },
              ),
              SingleTitleOptionCard(
                  text: "Advanced PIN Settings", ontap: () {}, w: w),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SettingHeaderCard(text: "Account"),
              SingleTitleOptionCard(
                  text: "Change phone number", ontap: () {}, w: w),
              TitleDescriptionOptionCard(
                w: w,
                ontap: () {},
                title: "Transfer account",
                description: "Transfer account to a new Android device",
              ),
              RedTitleOptionCard(text: "Delete account", ontap: () {}, w: w),
            ],
          ),
        ),
      ),
    );
  }
}
