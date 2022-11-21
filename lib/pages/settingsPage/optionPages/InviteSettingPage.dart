import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';

class InviteSettingPage extends StatefulWidget {
  const InviteSettingPage({super.key});

  @override
  State<InviteSettingPage> createState() => _InviteSettingPageState();
}

class _InviteSettingPageState extends State<InviteSettingPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
          "Invite friends",
          style: TextStyle(
              fontSize: 22, fontFamily: "Satoshi", fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: kAppBarPrimaryColor,
      body: SizedBox(
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 5, top: 10),
              child: Container(
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white24,
                      width: 1,
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Let's Switch to Zupe:\nhttps://zupe-the-last-app.web.app/",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Satoshi",
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 5, top: 20),
              child: Row(
                children: const [
                  Icon(
                    Icons.share,
                    color: Colors.white70,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Share",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
