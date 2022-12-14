import 'package:flutter/material.dart';

WidgetBuilder get groupChatlocalDialogBuilder {
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
                    onTap: () {},
                    child: const Text(
                      "Disappearing messages",
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
                      "Group settings",
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
                      "All media",
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
                      "Search",
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
                      "Add to home screen",
                      style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    )),
                // const SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  };
}
