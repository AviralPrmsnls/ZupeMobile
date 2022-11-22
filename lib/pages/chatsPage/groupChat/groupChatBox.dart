import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/chatsPage/groupChat/groupChatProfilePage.dart';

import '../../../widgets/homepageWidgets/groupChatLocalDigitalBuilder.dart';

class GroupChatBox extends StatefulWidget {
  const GroupChatBox({super.key});

  @override
  State<GroupChatBox> createState() => _GroupChatBoxState();
}

class _GroupChatBoxState extends State<GroupChatBox> {
  List<String> repliedMessageList = [];
  bool istyped = false;
  bool showEmojiKeyboard = false;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kchatPageColor,
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupChatProfilePage()),
                    );
                  });
                },
                child: CircleAvatar(
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
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupChatProfilePage()),
                    );
                  });
                },
                child: const Text(
                  "Marketing Prmsnls",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Image.asset(
            "assets/images/videoCallIcon.png",
            height: 20,
            width: 40,
          ),
          const SizedBox(
            width: 15,
          ),
          const Icon(Icons.call),
          const SizedBox(
            width: 15,
          ),
          InkWell(
              onTap: () {
                showAlignedDialog(
                    context: context,
                    builder: groupChatlocalDialogBuilder,
                    followerAnchor: Alignment.topRight,
                    offset: Offset(-25, 60),
                    isGlobal: true,
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(-1, 0), end: Offset(0, 0))
                            .animate(animation),
                        child: FadeTransition(
                          opacity: CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                          ),
                          child: child,
                        ),
                      );
                    });
              },
              child: const Icon(Icons.more_vert)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: kchatPageColor,
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            height: h - 85,
            width: w,
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/images/dp.png",
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Peter Parker",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Satoshi",
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      // const Text(
                      //   "+91 90045 63546",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontFamily: "Satoshi",
                      //       fontSize: 15),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Friday, May 13",
                    style: TextStyle(
                        color: Colors.white60,
                        fontFamily: "Satoshi",
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReceivedMessage(
                      "How you’ll doing guys? I’ll be coming to Bombay soon",
                      w,
                      "Pritam"),
                  RepliedMessage("It’s great to hear that Pritesh "),
                  ReceivedMessageRepliedBack(
                      "How you’ll doing guys? I’ll be coming to Bombay soon",
                      w,
                      "Pritam",
                      "Derrick",
                      "Meet me too soon mate!"),
                  ReceivedMessageRepliedBack(
                      "How you’ll doing guys? I’ll be coming to Bombay soon",
                      w,
                      "Pritam",
                      "Pooja",
                      "Im here for Christmas!!"),
                  const SizedBox(
                    height: 100,
                  ),
                  for (int i = 0; i < repliedMessageList.length; i++)
                    RepliedMessage(repliedMessageList[i]),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              width: w,
              height: 80,
              decoration: (MediaQuery.of(context).viewInsets.bottom != 0)
                  ? BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)))
                  : BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Container(
                      width: w - 100,
                      height: 50,
                      child: TextFormField(
                        onFieldSubmitted: (value) {
                          if (istyped) {
                            setState(() {
                              repliedMessageList.add(controller.text);
                              controller.clear();
                            });
                          }
                        },
                        controller: controller,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              istyped = false;
                            });
                          } else {
                            setState(() {
                              istyped = true;
                            });
                          }
                        },
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.center,
                        autofocus: false,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                            fontFamily: "Satoshi",
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  showEmojiKeyboard = !showEmojiKeyboard;
                                });
                              },
                              child: const Icon(
                                Icons.emoji_emotions,
                                color: Colors.white,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 0.0, right: 10),
                              child: Container(
                                width: 60,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            hintText: "Message",
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(91, 91, 91, 1),
                                fontSize: 15),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(45, 41, 40, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(45, 41, 40, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(45, 41, 40, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            fillColor: Color.fromRGBO(45, 41, 40, 1),
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        if (istyped) {
                          setState(() {
                            repliedMessageList.add(controller.text);
                            controller.clear();
                            istyped = false;
                          });
                        }
                      },
                      child: Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: kNeonColor),
                        child: Center(
                          child: Icon(
                            istyped ? Icons.send : Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ]),
    );
  }

  ReceivedMessageRepliedBack(String text, double w, String RepliedBy,
      String RepliedBack, String RepliedBackMessage) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 15.0, top: 10, left: 20, right: 80),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: w * .68,
                  decoration: BoxDecoration(
                      color: kRepliedMessageColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10.0,
                          top: 8,
                          left: 15,
                        ),
                        child: Text(
                          RepliedBack,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Satoshi",
                              fontSize: 12),
                        ),
                      ),
                      Container(
                        width: w * .68,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kRecievedMessageColor),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 7.0, left: 15, right: 15, bottom: 7),
                            child: (text.length > 20)
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            RepliedBy,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Satoshi",
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            text,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Satoshi",
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            RepliedBy,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Satoshi",
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            text,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Satoshi",
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                      ),
                      Container(
                        width: w * .68,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20, right: 15, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      RepliedBackMessage,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Satoshi",
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "12:30 pm",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromRGBO(255, 255, 255, .6)),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: CircleAvatar(
                radius: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/dp2.png",
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ReceivedMessage(String text, double w, String RepliedBy) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 15.0, top: 2, left: 20, right: 80),
        child: Stack(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Container(
                    width: w * .68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kRecievedMessageColor),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 7.0, left: 15, right: 15, bottom: 7),
                        child: (text.length > 20)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        RepliedBy,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Satoshi",
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        text,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Satoshi",
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "12:30 pm",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromRGBO(255, 255, 255, .6)),
                                  )
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        RepliedBy,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Satoshi",
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        text,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Satoshi",
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "12:30 pm",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromRGBO(255, 255, 255, .6)),
                                  )
                                ],
                              )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: CircleAvatar(
                radius: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/dp3.png",
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  RepliedMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 4.0, top: 4, right: 20, left: 80),
        child: InkWell(
          onLongPress: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kRepliedMessageColor),
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 7.0, left: 15, right: 15, bottom: 7),
                child: (text.length > 30)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Satoshi",
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("12:30 pm",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          Color.fromRGBO(255, 255, 255, .6))),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.done_all,
                                size: 14,
                                color: kgreenTickColor,
                              )
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            text,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Satoshi",
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("12:30 pm",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          Color.fromRGBO(255, 255, 255, .6))),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.done_all,
                                size: 14,
                                color: kgreenTickColor,
                              )
                            ],
                          ),
                        ],
                      )),
          ),
        ),
      ),
    );
  }
}
