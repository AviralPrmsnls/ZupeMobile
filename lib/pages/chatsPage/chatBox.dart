import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/chatsPage/chatProfilePage.dart';
import 'package:zupe/pages/homePage/calls.dart';
import 'package:zupe/pages/homePage/chats.dart';
import 'package:zupe/pages/homePage/status.dart';
import 'package:zupe/service/provider.dart';
import 'package:zupe/widgets/tabBarHeader.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  List<String> repliedMessageList = ["Hi Ryan Reynolds, come join us !!"];
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
        backgroundColor: kAppBarPrimaryColor,
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
                          builder: (context) => ChatProfilePage()),
                    );
                  });
                },
                child: CircleAvatar(
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
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatProfilePage()),
                  );
                });
              },
              child: const Text(
                "Ryan Reynolds",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.video_call),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.call),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.more_vert),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 181, 235, 241),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: h - 85,
              width: w,
              // decoration: BoxDecoration(
              //   color: Color.fromARGB(255, 181, 235, 241),
              // ),
              // image: DecorationImage(
              //     image: AssetImage("assets/images/dp.png"),
              //     fit: BoxFit.fill)),
              child: Container(
                height: h,
                width: w,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      RepliedMessage("HI Ryan Reynolds"),
                      ReceivedMessage("Hi Zupe"),
                      ReceivedMessage("How you Doing?"),
                      RepliedMessage("I am good !"),
                      RepliedMessage("What About You ?"),
                      ReceivedMessage("I am Great 😁!"),
                      for (int i = 0; i < repliedMessageList.length; i++)
                        RepliedMessage(repliedMessageList[i]),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
              bottom: 10,
              left: 5,
              child: Row(
                children: [
                  Container(
                    width: w - 65,
                    height: 55,
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
                      autofocus: true,
                      cursorColor: Colors.green,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
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
                              color: Colors.grey,
                            ),
                          ),
                          suffix: Container(
                            width: istyped ? 40 : 60,
                            height: 55,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.attach_file,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  if (!istyped)
                                    const Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey,
                                    )
                                ],
                              ),
                            ),
                          ),
                          hintText: "Message",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(149, 6, 6, 6),
                              fontSize: 15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      if (istyped) {
                        setState(() {
                          repliedMessageList.add(controller.text);
                          controller.clear();
                        });
                      }
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: kAppBarPrimaryColor),
                      child: Center(
                        child: Icon(
                          istyped ? Icons.send : Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )),
          // Positioned(
          //   bottom: 40,
          //   child: EmojiKeyboard(
          //       emotionController: controller,
          //       emojiKeyboardHeight: 300,
          //       showEmojiKeyboard: showEmojiKeyboard,
          //       darkMode: true),
          // ),
        ],
      ),
    );
  }

  ReceivedMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 2.0, top: 2, left: 10, right: 80),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 243, 249, 243)),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 10, right: 10, bottom: 5),
              child: (text.length > 20)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          text,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "12:30 pm",
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        )
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          text,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "12:30 pm",
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        )
                      ],
                    )),
        ),
      ),
    );
  }

  RepliedMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 2.0, top: 2, right: 10, left: 80),
        child: InkWell(
          onLongPress: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 198, 237, 199)),
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 10, right: 10, bottom: 5),
                child: (text.length > 20)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            text,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "12:30 pm",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          )
                        ],
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            text,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "12:30 pm",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          )
                        ],
                      )),
          ),
        ),
      ),
    );
  }
}
