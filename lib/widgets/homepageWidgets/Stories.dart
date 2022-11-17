import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_time/story_page_view/story_page_view.dart';
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
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setStoriesOpened(true);
    });
  }

  setStoriesOpened(bool isopen) {
    Provider.of<StoriesProvider>(context, listen: false).setStoriesPageOpen =
        isopen;
  }

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
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
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
