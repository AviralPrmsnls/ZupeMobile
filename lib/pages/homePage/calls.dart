import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/material.dart';

import 'package:zupe/constant/constant.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateCallLinkCard(w: w),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 4.0, bottom: 4, right: 10),
            child: Text(
              "Recent",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(150, 0, 0, 0)),
            ),
          ),
          for (int i = 0; i < 15; i++) getcalls(w, i),
        ],
      ),
    );
  }

  CallsCard getcalls(double w, int i) {
    if (i % 2 == 0) {
      return CallsCard(
        w: w,
        isCallType: 1,
        isVideoCall: false,
      );
    } else {
      return CallsCard(w: w, isVideoCall: true, isCallType: 3);
    }
  }
}

class CreateCallLinkCard extends StatelessWidget {
  const CreateCallLinkCard({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 2),
      child: Container(
        height: 80,
        width: w,
        // color: Colors.amber,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 18, 140, 107),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.link,
                  color: Colors.white,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w - 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Create call link",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: w - 100,
                          child: AutoScrollText(
                            "Share a link for your Zupe call                   ",
                            velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(150, 0, 0, 0)),
                            textAlign: TextAlign.left,
                            selectable: true,
                            numberOfReps: 3,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              // Icon(Icons.more_horiz, color: kAppBarPrimaryColor)
            ],
          ),
        ),
      ),
    );
  }
}

class CallsCard extends StatelessWidget {
  CallsCard(
      {Key? key,
      required this.w,
      required this.isCallType,
      required this.isVideoCall})
      : super(key: key);
  bool isVideoCall;
  // isCallType =1 Missed Call
  // isCallType =2 Incoming Call
  // isCallType =3 Outgoing Call
  int isCallType;

  final double w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 2),
      child: Container(
        height: 80,
        width: w,
        // color: Colors.amber,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/dp.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.fill,
                    ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w - 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Ryan Reynolds",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          (isCallType == 1 || isCallType == 2)
                              ? Icons.call_received
                              : Icons.call_made,
                          size: 18,
                          color: isCallType == 2
                              ? Colors.green.shade500
                              : isCallType == 1
                                  ? Colors.red
                                  : Colors.green.shade500,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Today, 09:50 am",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(150, 0, 0, 0)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Icon(isVideoCall ? Icons.video_call : Icons.call,
                  color: kAppBarPrimaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
