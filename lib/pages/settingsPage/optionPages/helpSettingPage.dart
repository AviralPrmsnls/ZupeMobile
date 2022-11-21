import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/widgets/settingPageWidgets/titleDescriptionOptionCard.dart';

class HelpSettingPage extends StatefulWidget {
  const HelpSettingPage({super.key});

  @override
  State<HelpSettingPage> createState() => _HelpSettingPageState();
}

class _HelpSettingPageState extends State<HelpSettingPage> {
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
          "Help",
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
            TextIconCard(
              text: "Support Center",
              icon: Icons.share,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
              child: Text(
                "Contact Us",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Satoshi", fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Colors.white12,
            ),
            TitleDescriptionOptionCard(
                title: "Version", description: "6.2.3", w: w, ontap: () {}),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
              child: Text(
                "Debug log",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Satoshi", fontSize: 18),
              ),
            ),
            TextIconCard(
              text: "Terms & Privay Policy",
              icon: Icons.share,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Copyright Zupe Messenger",
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: "Satoshi",
                        fontSize: 16),
                  ),
                  Text(
                    "Licensed under the GPLv3",
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: "Satoshi",
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextIconCard extends StatelessWidget {
  TextIconCard({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontFamily: "Satoshi", fontSize: 18),
          ),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
