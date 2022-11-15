import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/chatsPage/chatBox.dart';
import 'package:zupe/pages/homePage/chats.dart';
import 'package:zupe/pages/settingsPage/settingPage.dart';

class HomePageModified extends StatefulWidget {
  HomePageModified({Key? key}) : super(key: key);

  @override
  State<HomePageModified> createState() => _HomePageModifiedState();
}

class _HomePageModifiedState extends State<HomePageModified> {
  int Chatindex = -1;
  bool isSearched = false;
  bool isArchived = false;
  bool isResultFound = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: DraggableHome(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  isSearched = true;
                });
              },
              child: isSearched
                  ? SearchBox(w, h)
                  : Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          color: kFloatingbtnColor),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: kFloatingiconColor,
                          size: 30,
                        ),
                      ),
                    ),
            ),
          ),
          curvedBodyRadius: 25,
          stretchTriggerOffset: 20,
          appBarColor: Color.fromRGBO(19, 19, 19, 1),
          headerExpandedHeight: h < 741 ? 0.48 : 0.37,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingPage()),
                    );
                  });
                },
                child: CircleAvatar(
                  radius: 18,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/dp3.png",
                      height: 37,
                      width: 37,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.more_vert,
              size: 35,
            )
          ],
          alwaysShowLeadingAndAction: true,
          // fullyStretchable: true,
          alwaysShowTitle: true,
          // expandedBody: Container(
          //   height: h,
          //   width: w,
          // ),
          centerTitle: false,
          title: Image.asset(
            "assets/images/zupe.png",
            height: 50,
          ),
          backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
          headerWidget: Container(
            height: h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Story",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: w,
                    height: 89,
                    color: Colors.transparent,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 22.0),
                            child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/dp3.png")),
                                    color: kdarkGreyColor,
                                    borderRadius: BorderRadius.circular(70)),
                                child: const Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Color.fromARGB(68, 255, 255, 255),
                                )),
                          ),
                        ),
                        for (int i = 0; i < 15; i++)
                          (i % 2 == 0) ? Story() : seenStory(),
                        const SizedBox(width: 15),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: [
            SizedBox(
              height: 6,
              width: w,
              child: Center(
                  child: Container(
                height: 6,
                width: 80,
                color: Colors.black,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent Chat",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  // archiveBtn(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < 10; i++)
              InkWell(
                  onTap: () {},
                  child: ChatCard(
                    index: i,
                    Chatindex: Chatindex,
                  ))
          ]),
    );
  }

  Stack SearchBox(double w, double h) {
    return Stack(
      children: [
        Positioned(
          bottom: 33,
          left: w * .07,
          child: Container(
            height: h * .36,
            decoration: BoxDecoration(
                color: kfloatCardColor,
                border: Border.all(color: kNeonColor),
                borderRadius: BorderRadius.circular(35)),
            width: w * .86,
            child: isResultFound
                ? SearchResults()
                : const Center(
                    child: Text(
                      "No Result Found !!",
                      style: TextStyle(color: kfloatCardHeadTextColor),
                    ),
                  ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 75,
            width: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kFloatingbtnColor),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 20),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        isResultFound = false;
                      });
                    } else {
                      setState(() {
                        isResultFound = true;
                      });
                    }
                  },
                  maxLines: 1,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isSearched = false;
                          isResultFound = false;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  validator: (value) {
                    if (value!.length > 2) {
                      return null;
                    } else {
                      return "Enter atleast 2 characters";
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding SearchResults() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22, top: 2, bottom: 2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 22,
            ),
            const Text(
              "Groups",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Satoshi",
                  color: kfloatCardHeadTextColor),
            ),
            const SizedBox(
              height: 10,
            ),
            SearchGroupCard(),
            const Text(
              "Contacts",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Satoshi",
                  color: kfloatCardHeadTextColor),
            ),
            const SizedBox(
              height: 10,
            ),
            SearchIndividualCard(),
            SearchIndividualCard(),
            SearchIndividualCard(),
            SearchIndividualCard(),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget SearchGroupCard() {
    return SizedBox(
      height: 50,
      child: Expanded(
        child: Row(
          children: [
            CircleAvatar(
              radius: 17,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/permissionless.png",
                  height: 34,
                  width: 34,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Marketing Prmlsns",
                    style: TextStyle(
                        fontFamily: "Satoshi",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Text(
                      "Pritesh: Hey Guys, Chief is speaking at ..",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          color: Color.fromRGBO(100, 100, 100, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget SearchIndividualCard() {
    return SizedBox(
      height: 50,
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 17,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/story2.png",
                  height: 34,
                  width: 34,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Mac",
                    style: TextStyle(
                        fontFamily: "Satoshi",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Text(
                      "Congratulations!",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          color: Color.fromRGBO(100, 100, 100, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget archiveBtn() {
    return InkWell(
      onTap: () {
        setState(() {
          isArchived = !isArchived;
        });
      },
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/downloadIcon.png",
                height: 20,
                color:
                    !isArchived ? Colors.white : Color.fromRGBO(173, 255, 0, 1),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Archive Chat",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget Story() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    173,
                    255,
                    0,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(70)),
              child: Center(
                child: CircleAvatar(
                  radius: 33,
                  child: Image.asset(
                    "assets/images/story2.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Sandy",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget seenStory() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: kGreyColor, borderRadius: BorderRadius.circular(70)),
              child: Center(
                child: CircleAvatar(
                  radius: 35,
                  child: Image.asset(
                    "assets/images/story2.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Sandy",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class ChatCard extends StatefulWidget {
  ChatCard({Key? key, required this.Chatindex, required this.index})
      : super(key: key);
  int Chatindex;
  int index;
  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatBox()),
          );
        });
      },
      child: Container(
        height: 90,
        width: w,
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/dp.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6.0,
                      bottom: 6,
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: w - 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Peter Parker",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "00:21",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w - 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Ur Welcome :)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 98, 98, 1)),
                                ),
                                Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(
                                      color: kNeonColor,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: Text(
                                      "1",
                                      style: GoogleFonts.robotoFlex(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
