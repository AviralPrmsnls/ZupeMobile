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
        backgroundColor: kAppBarPrimaryColor,
        centerTitle: false,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
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
            Padding(
              padding: EdgeInsets.only(left: 65, right: 40, bottom: 10),
              child: Text(
                "This is not your username or pin. This name will be visible to your Zupe contacts",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kGreyColor),
              ),
            ),
            AboutEdit(w, () {}),
            phoneNumeber(w)
          ],
        ),
      ),
    );
  }

  Widget phoneNumeber(
    double w,
  ) {
    return Container(
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
                  Icons.call,
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
                          "Phone",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: kGreyColor),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "+91 7007042761",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.help,
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
                            "About",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: kGreyColor),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "😁",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.edit,
              color: kAppBarPrimaryColor,
            )
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
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
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
                            "Name",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: kGreyColor),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Tony Stark 😎",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.edit,
              color: kAppBarPrimaryColor,
            )
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
                  color: kAppBarPrimaryColor),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
