import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/settingHeaderCard.dart';
import 'package:zupe/widgets/settingPageWidgets/switchBtnSettingsOptionCard.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class StoriesSettingPage extends StatefulWidget {
  const StoriesSettingPage({super.key});

  @override
  State<StoriesSettingPage> createState() => _StoriesSettingPageState();
}

class _StoriesSettingPageState extends State<StoriesSettingPage> {
  bool isViewReceipts = true;
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
          "Stories",
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
              InkWell(
                onTap: () {},
                child: Container(
                  // height: 50,
                  width: w,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Story updates automatically disappear fter 24 hours. Choose who can view your story or create new stories with specific viewers or groups.",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w400,
                          color: Colors.white60),
                    ),
                  ),
                ),
              ),
              SettingHeaderCard(text: "Stories"),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: kFloatingbtnColor,
                            borderRadius: BorderRadius.circular(70)),
                        child: const Center(
                          child: CircleAvatar(
                            backgroundColor: kFloatingbtnColor,
                            radius: 35,
                            child: Icon(Icons.add),
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "New Story",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/dp3.png",
                          height: 37,
                          width: 37,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "New Story",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Satoshi",
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Text(
                          "Tap to choose our viewers",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Satoshi",
                              fontWeight: FontWeight.w400,
                              color: Colors.white60),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
                color: Colors.white12,
              ),
              SwitchBtnSettingsOptionCard(
                header: "View receipts",
                description:
                    "See and share when stories are viewed. if disabled, you won't see when others view your story",
                isSelect: isViewReceipts,
                ontap: () {
                  setState(() {
                    isViewReceipts = !isViewReceipts;
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
                  title: "Turn off Stories",
                  description:
                      "If you opt out of stories you will no longer be able to share or view stories.",
                  w: w,
                  ontap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
