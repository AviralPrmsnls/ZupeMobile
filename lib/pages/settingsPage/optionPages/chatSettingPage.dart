import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/redTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/settingHeaderCard.dart';
import 'package:zupe/widgets/settingPageWidgets/singleTitleOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchBtnSettingsOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchSingleTextBtnOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class ChatSettingPage extends StatefulWidget {
  const ChatSettingPage({super.key});

  @override
  State<ChatSettingPage> createState() => _ChatSettingPageState();
}

class _ChatSettingPageState extends State<ChatSettingPage> {
  bool isGeneratlink = true;
  bool isUseAddressBookPics = false;
  bool isUseSystemEmoji = false;
  bool isEnterKeySends = false;
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
          "Chats",
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
              SingleTitleOptionCard(text: "SMS and MMS", ontap: () {}, w: w),
              SwitchBtnSettingsOptionCard(
                header: "Generate link previews",
                description:
                    "Retrievelink previews directly from websites for messages you send",
                isSelect: isGeneratlink,
                ontap: () {
                  setState(() {
                    isGeneratlink = !isGeneratlink;
                  });
                },
              ),
              SwitchBtnSettingsOptionCard(
                header: "Use address book photos",
                description:
                    "Display contact photos from your address book if available",
                isSelect: isUseAddressBookPics,
                ontap: () {
                  setState(() {
                    isUseAddressBookPics = !isUseAddressBookPics;
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
              SettingHeaderCard(text: "Keyboard"),
              SwitchSingleBtnSettingsOptionCard(
                header: "Use system emoji",
                isSelect: isUseSystemEmoji,
                ontap: () {
                  setState(() {
                    isUseSystemEmoji = !isUseSystemEmoji;
                  });
                },
              ),
              SwitchSingleBtnSettingsOptionCard(
                header: "Enter key sends",
                isSelect: isEnterKeySends,
                ontap: () {
                  setState(() {
                    isEnterKeySends = !isEnterKeySends;
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
              SettingHeaderCard(text: "Backups"),
              TitleDescriptionOptionCard(
                  title: "Chat backups",
                  description: "disabled",
                  w: w,
                  ontap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
