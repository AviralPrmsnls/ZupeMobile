import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/homePage/calls.dart';
import 'package:zupe/pages/homePage/chats.dart';
import 'package:zupe/pages/homePage/status.dart';
import 'package:zupe/pages/settingsPage/settingPage.dart';
import 'package:zupe/service/provider.dart';
import 'package:zupe/widgets/tabBarHeader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

PageController caraousalControler = PageController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarPrimaryColor,
        title: const Text(
          "Zupe",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        centerTitle: false,
        actions: [
          const Icon(Icons.search),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                });
              },
              child: const Icon(Icons.more_vert)),
          const SizedBox(
            width: 10,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TabBarHeader(
                  tabNumber: 1,
                  text: "CHATS",
                ),
                TabBarHeader(
                  tabNumber: 2,
                  text: "STATUS",
                ),
                TabBarHeader(
                  tabNumber: 3,
                  text: "CALLS",
                ),
              ],
            )),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: kAppBarPrimaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Icon(
            Provider.of<TabBarProvider>(context, listen: false).selectPage == 1
                ? Icons.chat
                : Provider.of<TabBarProvider>(context, listen: false)
                            .selectPage ==
                        2
                    ? Icons.camera_alt
                    : Icons.add_call,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BannerCarousel(
              pageController: caraousalControler,
              onPageChanged: (value) {
                setState(() {
                  Provider.of<TabBarProvider>(context, listen: false)
                      .SelectPage = value + 1;
                });
              },
              margin: const EdgeInsets.only(left: 0, right: 0),
              customizedBanners: [ChatsPage(), StatusPage(), CallsPage()],
              height: h,
              activeColor: Colors.transparent,
              disableColor: Colors.transparent,
              animation: true,
              borderRadius: 0,
              width: w,
              indicatorBottom: false,
            ),
          ),
        ],
      ),
    );
  }
}
