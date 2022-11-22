import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';

import 'package:provider/provider.dart';

import 'package:story_time/story_page_view/story_page_view.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/model/userModel.dart';

import 'package:zupe/pages/settingsPage/settingPage.dart';
import 'package:zupe/provider/storiesPageProvider.dart';
import 'package:zupe/widgets/homepageWidgets/HeaderWidget.dart';
import 'package:zupe/widgets/homepageWidgets/Stories.dart';
import 'package:zupe/widgets/homepageWidgets/chatCard.dart';
import 'package:zupe/widgets/homepageWidgets/groupChatCard.dart';

import '../../widgets/homepageWidgets/localDialogBuilder.dart';

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
  // late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  final sampleUsers = [
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User1",
        "https://images.unsplash.com/photo-1609262772830-0decc49ec18c?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMDF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User2",
        "https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzMjN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User3",
        "https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: DraggableHome(
        curvedBodyRadius: 25,
        stretchTriggerOffset: 200,
        appBarColor: Color.fromRGBO(19, 19, 19, 1),
        headerExpandedHeight: h < 741 ? 0.48 : 0.37,
        fullyStretchable: true,
        centerTitle: false,
        title: Image.asset(
          "assets/images/zupe.png",
          height: 50,
        ),
        stretchMaxHeight: .92,
        backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
        headerWidget: HeaderWidget(),
        expandedBody: StoriesPage(sampleUsers: sampleUsers),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 0),
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
          InkWell(
            onTap: () {
              showAlignedDialog(
                  context: context,
                  builder: localDialogBuilder,
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
            child: const Icon(
              Icons.more_vert,
              size: 35,
            ),
          )
        ],
        body: [
          Column(
            children: [
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
              HomeGroupChatCard(
                index: 0,
                Chatindex: Chatindex,
              ),
              for (int i = 0; i < 10; i++)
                HomeChatCard(
                  index: i,
                  Chatindex: Chatindex,
                )
            ],
          ),
        ],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            (Provider.of<StoriesProvider>(context).getStoriesPageOpen == true)
                ? SizedBox()
                : Padding(
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
                              child: Center(
                                  child: Image.asset(
                                "assets/icons/Zterminal.png",
                                height: 55,
                                width: 40,
                              )),
                            ),
                    ),
                  ),
      ),
    );
  }

  Stack SearchBox(double w, double h) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSearched = false;
            });
          },
          child: SizedBox(
            height: h,
            width: w,
          ),
        ),
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
                ? SearchResults(w)
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

  Padding SearchResults(double w) {
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
            SearchGroupCard(w),
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
            SearchIndividualCard(w),
            SearchIndividualCard(w),
            SearchIndividualCard(w),
            SearchIndividualCard(w),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget SearchGroupCard(double w) {
    return SizedBox(
      height: 50,
      width: w,
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
    );
  }

  Widget SearchIndividualCard(double w) {
    return SizedBox(
      height: 50,
      width: w,
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
}
