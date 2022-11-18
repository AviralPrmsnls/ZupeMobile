import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/model/userModel.dart';
import 'package:zupe/pages/settingsPage/settingPage.dart';
import 'package:zupe/provider/storiesPageProvider.dart';
import 'package:zupe/widgets/homepageWidgets/Stories.dart';
import 'package:zupe/widgets/homepageWidgets/localDialogBuilder.dart';

import '../../pages/homePage/homePagemodified.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
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

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      setStoriesOpened(false);
    });
  }

  setStoriesOpened(bool isopen) {
    // setState(() {
    Provider.of<StoriesProvider>(context, listen: false).setStoriesPageOpen =
        isopen;
    // });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            headerappbar(context),
            const SizedBox(
              height: 30,
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
                                  image: AssetImage("assets/images/dp3.png")),
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
    );
  }

  Row headerappbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/zupe.png",
          height: 50,
        ),
        Row(
          children: [
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
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget Story() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StoriesPage(
                            sampleUsers: sampleUsers,
                          )),
                );
              });
            },
            child: Container(
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
          ),
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
