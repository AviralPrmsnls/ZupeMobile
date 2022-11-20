import 'package:flutter/material.dart';

class SettingHeaderCard extends StatelessWidget {
  SettingHeaderCard({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}
