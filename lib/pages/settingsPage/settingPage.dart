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
        backgroundColor: kAppBarPrimaryColor,
        centerTitle: false,
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        height: h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileCard(),
              const SizedBox(
                height: 10,
              ),
              SettingOptions(w, "Account",
                  "Security notifications, change number", () {}, Icons.key),
              const SizedBox(
                height: 10,
              ),
              SettingOptions(w, "Privacy",
                  "Block contacts, disappearing messages", () {}, Icons.lock),
              const SizedBox(
                height: 10,
              ),
              SettingOptions(w, "Chats", "Theme wallpapers, chat history",
                  () {}, Icons.chat),
              const SizedBox(
                height: 10,
              ),
              SettingOptions(w, "Notifications", "Message, group % call tones",
                  () {}, Icons.notifications),
              const SizedBox(
                height: 10,
              ),
              SettingOptions(w, "Storage and data",
                  "Network usage, auto-download", () {}, Icons.pie_chart),
              const SizedBox(
                height: 10,
              ),
              SettingOptions(w, "App Language", "English (phone's language)",
                  () {}, Icons.language),
              const SizedBox(
                height: 10,
              ),
              SettingOptions(
                  w,
                  "Help",
                  "Help centre, contact us, privacy policy",
                  () {},
                  Icons.help_outline),
              SettingOptions(w, "Invite a friend", "", () {}, Icons.group),
              const SizedBox(
                height: 10,
              ),
              from(),
              const SizedBox(
                height: 40,
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

  Widget SettingOptions(double w, String text, String description,
      Function()? ontap, IconData? icon) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 85,
        width: w,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (icon == Icons.key)
                  ? const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.key,
                        color: kGreyColor,
                      ))
                  : Icon(
                      icon,
                      color: kGreyColor,
                    ),
              const SizedBox(
                width: 20,
              ),
              (description == "")
                  ? Text(
                      text,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Flexible(
                            child: Text(
                              description,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: kGreyColor),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/images/dp2.png",
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
                      "Tony Stark 😎",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "😁",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            const Icon(
              Icons.qr_code,
              color: kAppBarPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
