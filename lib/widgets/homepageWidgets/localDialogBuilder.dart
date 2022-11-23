import 'package:flutter/material.dart';

import '../../pages/chatsPage/groupChat/groupCreationPage/selectMembersPage.dart';

WidgetBuilder get localDialogBuilder {
  return (BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 30),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(41, 41, 41, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 18, color: Colors.black87),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectMembersPage()),
                      );
                    },
                    child: const Text(
                      "New Group",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Mark all read",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Mark all read",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Settings",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Notification profile",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Insights",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  };
}
