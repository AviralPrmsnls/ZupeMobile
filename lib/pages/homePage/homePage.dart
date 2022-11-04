import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/homePage/calls.dart';
import 'package:zupe/pages/homePage/chats.dart';
import 'package:zupe/pages/homePage/status.dart';
import 'package:zupe/service/provider.dart';
import 'package:zupe/widgets/tabBarHeader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

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
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
          SizedBox(
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
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: kAppBarPrimaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Icon(
            Icons.chat,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          if (Provider.of<TabBarProvider>(context).selectPage == 1)
            const ChatsPage(),
          if (Provider.of<TabBarProvider>(context).selectPage == 2)
            const StatusPage(),
          if (Provider.of<TabBarProvider>(context).selectPage == 3)
            const CallsPage(),
        ],
      ),
    );
  }
}
