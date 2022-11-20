import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: kFloatingbtnColor,
          ),
        ),
        backgroundColor: kchatPageColor,
        centerTitle: false,
        title: const Text(
          "Profile",
          style: TextStyle(
              fontSize: 22, fontFamily: "Satoshi", fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: kAppBarPrimaryColor,
      body: Container(
        height: h,
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileEdit(),
            const SizedBox(
              height: 20,
            ),
            NameEdit(w, () {}),
            AboutEdit(w, () {}),
            Badges(w),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
              child: Text(
                "Your profile and changes to it will be visible to people you message, contacts, and groups.",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Badges(
    double w,
  ) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 85,
        width: w,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.badge_outlined,
                    color: kGreyColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Flexible(
                          child: Text(
                            "Badges",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget AboutEdit(
    double w,
    Function()? ontap,
  ) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 85,
        width: w,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.description,
                    color: kGreyColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Flexible(
                          child: Text(
                            "Working on something new",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Write a few words about yourself",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget NameEdit(
    double w,
    Function()? ontap,
  ) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 70,
        width: w,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/profile.png",
              height: 25,
              width: 25,
              color: Colors.white60,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Lester",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Satoshi",
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: Text(
                      "Your name",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack profileEdit() {
    return Stack(
      children: [
        Container(
          height: 170,
          width: 170,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CircleAvatar(
              radius: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset(
                  "assets/images/dp2.png",
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kFloatingbtnColor),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
            ))
      ],
    );
  }
}
