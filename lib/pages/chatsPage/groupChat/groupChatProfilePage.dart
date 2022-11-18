import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';

class GroupChatProfilePage extends StatefulWidget {
  const GroupChatProfilePage({Key? key}) : super(key: key);

  @override
  _GroupChatProfilePageState createState() => _GroupChatProfilePageState();
}

class _GroupChatProfilePageState extends State<GroupChatProfilePage> {
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
      backgroundColor: kchatPageColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: kFloatingbtnColor,
              ),
            ),
            backgroundColor:
                _isSliverAppBarExpanded ? kchatPageColor : kchatPageColor,
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
                            "assets/images/permissionless.png",
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
                        "Marketing Prmsnls",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Satoshi",
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/permissionless.png",
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // const Icon(
                          //   Icons.more_vert,
                          //   size: 15,
                          // ),
                        ],
                      ),
                    ),
                  ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: kchatPageColor,
                width: w,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        "Marketing Prmsnls",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Satoshi",
                            fontSize: 29,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "We build public Infrastructure \non the internet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(98, 98, 98, 1)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/icons/video.png",
                            height: 30,
                          ),
                          Image.asset(
                            "assets/icons/audio.png",
                            height: 30,
                          ),
                          Image.asset(
                            "assets/icons/Z.png",
                            height: 45,
                            width: 30,
                          )
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TimerOptionCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    OtherOptionCard("paint", "Chat Colour & wallpaper"),
                    const SizedBox(
                      height: 20,
                    ),
                    OtherOptionCard("sound", "Sounds & notifications"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                      child: Text(
                        "Shared Media",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: w,
                      height: 100,
                      child: Card(
                        color: kchatPageColor,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (int i = 0; i < 10; i++)
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 140,
                                    width: 100,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/images/dp.png",
                                          fit: BoxFit.fill,
                                        ))),
                              )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 10, top: 10),
                      child: Text(
                        "404 members",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                      ),
                      child: OtherOptionCard("add", "Add members"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    UserCard("dp3", "You", "Admin"),
                    for (int i = 0; i < 7; i++)
                      (i % 2 == 0)
                          ? UserCard("dp", "Peter parker", "")
                          : UserCard("dp2", "Tony Stark", ""),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.12),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Image.asset(
                              "assets/icons/downwardArrow.png",
                              height: 10,
                              width: 10,
                            )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    RedOptionCard("leave", "Leave group"),
                    RedOptionCard("block", "Block group"),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget UserCard(String image, String Username, String role) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 30, bottom: 10, top: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/${image}.png",
                      height: 40,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  Username,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ],
            ),
            if (role == "Admin")
              Text(
                "Admin",
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(116, 116, 116, 1)),
              ),
          ],
        ),
      ),
    );
  }

  Widget RedOptionCard(
    String image,
    String text,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 30, bottom: 10, top: 10),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/${image}.png",
            height: 30,
            width: 30,
            color: Colors.red,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: "Satoshi",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.red),
          ),
        ],
      ),
    );
  }

  Row TimerOptionCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/icons/timer_off.png",
              height: 25,
              width: 30,
              color: Colors.white70,
            ),
            const SizedBox(
              width: 30,
            ),
            const Text(
              "Disappearing messages off",
              style: TextStyle(
                  fontFamily: "Satoshi",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(98, 98, 98, 1)),
            ),
          ],
        ),
      ],
    );
  }

  Row OtherOptionCard(
    String image,
    String text,
  ) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/${image}.png",
          height: 30,
          width: 30,
          color: Colors.white,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: "Satoshi",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ],
    );
  }
}
