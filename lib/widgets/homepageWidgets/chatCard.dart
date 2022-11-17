import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/pages/chatsPage/chatBox.dart';

class HomeChatCard extends StatefulWidget {
  HomeChatCard({Key? key, required this.Chatindex, required this.index})
      : super(key: key);
  int Chatindex;
  int index;
  @override
  State<HomeChatCard> createState() => _HomeChatCardState();
}

class _HomeChatCardState extends State<HomeChatCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatBox()),
          );
        });
      },
      child: Container(
        height: 90,
        width: w,
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/dp.png",
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
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
                    child: SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: w - 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Peter Parker",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "00:21",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w - 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Ur Welcome :)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(98, 98, 98, 1)),
                                ),
                                Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(
                                      color: kNeonColor,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: Text(
                                      "1",
                                      style: GoogleFonts.robotoFlex(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
