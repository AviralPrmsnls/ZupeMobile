import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_time/story_page_view/story_page_view.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/model/userModel.dart';
import 'package:zupe/provider/storiesPageProvider.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({
    Key? key,
    required this.sampleUsers,
  }) : super(key: key);

  final List<UserModel> sampleUsers;

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  bool isReplyTyped = false;
  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand(resume: true),
    );
    Future.delayed(Duration.zero, () async {
      setStoriesOpened(true);
    });
  }

  setStoriesOpened(bool isopen) {
    Provider.of<StoriesProvider>(context, listen: false).setStoriesPageOpen =
        isopen;
  }

  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  @override
  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  TextEditingController replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = widget.sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.network(
                  story.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "Satoshi",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     width: w - 100,
              //     height: 50,
              //     child: TextFormField(
              //       maxLines: 1,
              //       controller: replyController,
              //       textAlignVertical: TextAlignVertical.center,
              //       autofocus: false,
              //       cursorColor: Colors.white,
              //       style: const TextStyle(
              //           fontFamily: "Satoshi",
              //           color: Colors.white,
              //           fontSize: 17,
              //           fontWeight: FontWeight.w400),
              //       decoration: InputDecoration(
              //           prefixIcon: InkWell(
              //             onTap: () {},
              //             child: const Icon(
              //               Icons.emoji_emotions,
              //               color: Colors.white,
              //             ),
              //           ),
              //           suffixIcon: Padding(
              //             padding: const EdgeInsets.only(top: 0.0, right: 10),
              //             child: Container(
              //               width: 60,
              //               child: Row(
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: const [
              //                   const Icon(
              //                     Icons.camera_alt,
              //                     color: Colors.white,
              //                   ),
              //                   const SizedBox(
              //                     width: 5,
              //                   ),
              //                   const Icon(
              //                     Icons.mic,
              //                     color: Colors.white,
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //           hintText: "Message",
              //           hintStyle: const TextStyle(
              //               color: Color.fromRGBO(91, 91, 91, 1), fontSize: 15),
              //           focusedBorder: OutlineInputBorder(
              //             borderSide: const BorderSide(
              //                 color: Color.fromRGBO(45, 41, 40, 1), width: 1.0),
              //             borderRadius: BorderRadius.circular(35.0),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: const BorderSide(
              //                 color: Color.fromRGBO(45, 41, 40, 1), width: 1.0),
              //             borderRadius: BorderRadius.circular(35.0),
              //           ),
              //           errorBorder: OutlineInputBorder(
              //             borderSide: const BorderSide(
              //                 color: Color.fromRGBO(45, 41, 40, 1), width: 1.0),
              //             borderRadius: BorderRadius.circular(35.0),
              //           ),
              //           fillColor: Color.fromRGBO(45, 41, 40, 1),
              //           filled: true),
              //     ),
              //   ),
              // )
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return SizedBox(
            // height: h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      width: w - 100,
                      height: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              isReplyTyped = false;
                            });
                          } else {
                            setState(() {
                              isReplyTyped = true;
                            });
                          }
                        },
                        maxLines: 1,
                        controller: replyController,
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
                              onTap: () {},
                              child: const Icon(
                                Icons.camera_alt,
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
                                  children: [
                                    Icon(
                                      Icons.send,
                                      color: isReplyTyped
                                          ? kFloatingbtnColor
                                          : Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            hintText: "Send a message",
                            hintStyle: const TextStyle(
                                fontFamily: "Satoshi",
                                color: Colors.white,
                                fontSize: 12),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            // fillColor: Color.fromRGBO(45, 41, 40, 1),
                            filled: true),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        pageLength: widget.sampleUsers.length,
        storyLength: (int pageIndex) {
          return widget.sampleUsers[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
