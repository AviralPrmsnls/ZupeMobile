import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';

class LinkedDevicesPage extends StatefulWidget {
  const LinkedDevicesPage({super.key});

  @override
  State<LinkedDevicesPage> createState() => _LinkedDevicesPageState();
}

class _LinkedDevicesPageState extends State<LinkedDevicesPage> {
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
          "Linked Devices",
          style: TextStyle(
              fontSize: 22, fontFamily: "Satoshi", fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        decoration: BoxDecoration(
            color: kFloatingbtnColor, borderRadius: BorderRadius.circular(30)),
        width: 50,
        child: const Center(
          child: Icon(
            Icons.add,
            size: 30,
          ),
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
              "No devices linked",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Satoshi", fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
