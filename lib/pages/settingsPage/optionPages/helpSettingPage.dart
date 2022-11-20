import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Help coming soon!",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Satoshi", fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
