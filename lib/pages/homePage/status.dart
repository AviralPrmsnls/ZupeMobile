import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyStatusCard(w: w),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 4.0, bottom: 4, right: 10),
            child: Text(
              "Recent updates",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(150, 0, 0, 0)),
            ),
          ),
          for (int i = 0; i < 5; i++)
            OtherUserStatusCard(
              w: w,
              isStatusSeen: false,
            ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 4.0, bottom: 4, right: 10),
            child: Text(
              "Viewed updates",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(150, 0, 0, 0)),
            ),
          ),
          for (int i = 0; i < 5; i++)
            OtherUserStatusCard(
              w: w,
              isStatusSeen: true,
            ),
        ],
      ),
    );
  }
}

class MyStatusCard extends StatelessWidget {
  const MyStatusCard({
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
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
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
                            "My Status",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Yesterday, 10:54 pm",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(150, 0, 0, 0)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Icon(Icons.more_horiz, color: kAppBarPrimaryColor)
            ],
          ),
        ),
      ),
    );
  }
}

class OtherUserStatusCard extends StatelessWidget {
  OtherUserStatusCard({Key? key, required this.w, required this.isStatusSeen})
      : super(key: key);
  bool isStatusSeen;

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
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isStatusSeen ? Colors.grey : Colors.green.shade300,
                      width: 2),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
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
                      children: const [
                        Text(
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
              // Icon(Icons.more_horiz, color: kAppBarPrimaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
