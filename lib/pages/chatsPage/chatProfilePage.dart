import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:custom_switch/custom_switch.dart';

class ChatProfilePage extends StatefulWidget {
  const ChatProfilePage({Key? key}) : super(key: key);

  @override
  _ChatProfilePageState createState() => _ChatProfilePageState();
}

class _ChatProfilePageState extends State<ChatProfilePage> {
  late ScrollController _scrollController;
  Color _textColor = Colors.white;
  static const kExpandedHeight = 200.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              )
            ],
            backgroundColor:
                _isSliverAppBarExpanded ? kAppBarPrimaryColor : Colors.white,
            // show and hide SliverAppBar Title
            centerTitle: false,
            title: _isSliverAppBarExpanded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/dp.png",
                            height: 55,
                            width: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Ryan Reynolds",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                : null,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: kExpandedHeight,
            // show and hide FlexibleSpaceBar title
            flexibleSpace: _isSliverAppBarExpanded
                ? null
                : FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    title: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                          CircleAvatar(
                            radius: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/dp.png",
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.more_vert,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                width: w,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        "Ryan Reynolds",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "+91 7007042761",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Icon(
                                Icons.call,
                                color: kAppBarPrimaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Audio",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kAppBarPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Icon(
                                Icons.video_call,
                                color: kAppBarPrimaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Video",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kAppBarPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Icon(
                                Icons.search,
                                color: kAppBarPrimaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kAppBarPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 15, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, There i am using Zupe !",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "28 September",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Media, links, and docs",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 143, 142, 142)),
                            ),
                            Row(
                              children: const [
                                Text(
                                  "10",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 143, 142, 142)),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: Color.fromARGB(255, 143, 142, 142),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: w,
                        height: 100,
                        child: Card(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (int i = 0; i < 10; i++)
                                Padding(
                                  padding: const EdgeInsets.only(left: 05),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 140,
                                      width: 100,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                            "assets/images/dp.png",
                                            fit: BoxFit.fill,
                                          ))),
                                )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 15, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.notifications,
                                color: kGreyColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Mute Notifications",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Transform.scale(
                              scale: 1,
                              child: Switch(
                                onChanged: toggleSwitch,
                                value: isSwitched,
                                activeColor: kAppBarPrimaryColor,
                                activeTrackColor:
                                    Color.fromARGB(94, 18, 140, 126),
                                inactiveThumbColor: kGreyColor,
                                inactiveTrackColor:
                                    Color.fromARGB(81, 143, 142, 142),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.music_note,
                                color: kGreyColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Custom Notifications",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.image,
                                color: kGreyColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Media visibility",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Color.fromRGBO(255, 255, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 15, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lock,
                                color: kGreyColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Encryption",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: w - 100,
                                    child: const Text(
                                      "Messages and calls are end-to-end encrypted. Taop to verify",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.timer,
                                color: kGreyColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Disappearing messages",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
