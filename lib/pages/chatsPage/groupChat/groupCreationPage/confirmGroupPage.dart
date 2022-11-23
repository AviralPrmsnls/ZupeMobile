import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zupe/pages/chatsPage/groupChat/groupCreationPage/selectMembersPage.dart';
import 'package:zupe/provider/selectedGroupContact.dart';
import 'package:zupe/widgets/CircularRadioBtn.dart';

class ConfirmGroupPage extends StatefulWidget {
  const ConfirmGroupPage({super.key});

  @override
  State<ConfirmGroupPage> createState() => _ConfirmGroupPageState();
}

class _ConfirmGroupPageState extends State<ConfirmGroupPage> {
  TextEditingController contactController = TextEditingController();
  bool isContactShow = false;
  List<String> phoneNumber = [];
  List<String> name = [];
  int contactvalue = -1;

  getContact() {
    setState(() {
      phoneNumber = [
        "+91 7007042761",
        "+91 7080125888",
        "+91 7007089393",
        "+91 7007077777",
        "+91 9393939393",
        "+91 9393939399"
      ];
      name = [
        "Aviral Dixit",
        "Mark Evans",
        "Axel Blaze",
        "Elon Musk",
        "Charlie Chaplin",
        "Stephen Hawkigs"
      ];
      isContactShow = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isSelect = true;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kFloatingbtnColor,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 20.0, right: 20),
              child: Text(
                "Skip",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Satoshi",
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
          title: const Text(
            "Select Members",
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: kAppBarPrimaryColor,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 25, bottom: 10),
          child: InkWell(
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  // side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Color.fromRGBO(34, 34, 34, 1),
                title: const Text(
                  'Invitation sent',
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kFloatingbtnColor),
                ),
                content: const Text(
                  'Few participants cannot be automatically added to this group by you.\n\nThey’ve been invited to join, and wont be able to see any group messages until they accept.',
                  style: TextStyle(
                      fontFamily: "Satoshi",
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();

                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return InviteFriendsBottomSheet(w, context);
                        },
                      );
                    },
                    child: const Text('OK',
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kFloatingbtnColor)),
                  ),
                ],
              ),
            ),
            child: Container(
              width: w,
              height: 45,
              decoration: BoxDecoration(
                  color: kFloatingbtnColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                "Create",
                style: TextStyle(
                    fontFamily: "Satoshi",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            ),
          ),
        ),
        body: Container(
          height: h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: kRepliedMessageColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/icons/camera.png",
                              fit: BoxFit.contain,
                              color: kFloatingbtnColor,
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: w * .6,
                        // height: 30,
                        child: TextFormField(
                          controller: contactController,
                          // maxLines: 1,

                          autofocus: false,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                              fontFamily: "Satoshi",
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "Group Name",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.62),
                                  fontSize: 15),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              // fillColor: kRepliedMessageColor,
                              filled: true),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Members",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(215, 211, 211, 1)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    children: [
                      for (var contact
                          in Provider.of<SelectGroupContactProvider>(context)
                              .getContactForGroup)
                        ContactCardPage(
                          contactName: contact,
                          contacNumber: "+91 7007042761",
                          index: 0,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Container InviteFriendsBottomSheet(double w, BuildContext context) {
    return Container(
      height: 400,
      color: kRepliedMessageColor,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Invite Friends",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w500,
                      color: kFloatingbtnColor,
                    )),
                const Text(
                    "Share a link with friends to let them quickly join this group",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
                Container(
                  width: w * .8,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            kFloatingbtnColor,
                            Color.fromRGBO(58, 62, 50, 1)
                          ]),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Container(
                      width: (w * .8) - 2,
                      height: 98,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: kRepliedMessageColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Approve new members",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Satoshi",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      )),
                                  Text(
                                      "Require an admin to approve new members joining via the group link",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Satoshi",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                            Switch(
                                // thumb color (round icon)
                                activeColor:
                                    const Color.fromRGBO(173, 255, 0, 1),
                                activeTrackColor:
                                    const Color.fromRGBO(173, 255, 0, .3),
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.white24,
                                splashRadius: 50.0,
                                value: isSelect,
                                onChanged: (value) {
                                  setState(() {
                                    isSelect = !value;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return ShareLinkBottomSheet(w, context);
                        },
                      );
                    });
                  },
                  child: Container(
                    width: w * .5,
                    height: 45,
                    decoration: BoxDecoration(
                        color: kFloatingbtnColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Enable and Share link",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

Container ShareLinkBottomSheet(double w, BuildContext context) {
  return Container(
    height: 400,
    color: kRepliedMessageColor,
    child: Center(
      child: Padding(
          padding:
              const EdgeInsets.only(top: 40.0, bottom: 60, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  "Anyone with this link can view the group’s name and photo and join the group. Share it with people you trust",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/chat.png",
                    color: kFloatingbtnColor,
                    height: 40,
                    width: 35,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: const Text("Share Via Zupe",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copy,
                    color: kFloatingbtnColor,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: const Text("Copy",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.share,
                    color: kFloatingbtnColor,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: const Text("Share",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code,
                    color: kFloatingbtnColor,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: const Text("QR Code",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ],
              )
            ],
          )),
    ),
  );
}

class ContactCardPage extends StatefulWidget {
  ContactCardPage(
      {super.key,
      required this.contactName,
      required this.index,
      required this.contacNumber});

  String contactName;
  String contacNumber;
  int index;
  @override
  State<ContactCardPage> createState() => _ContactCardPageState();
}

class _ContactCardPageState extends State<ContactCardPage> {
  String getContactInitial() {
    String initals = "";
    String name = widget.contactName;
    name.trim();
    String firstAlphabet = name[0];
    String secondAlphabet = "";
    if (name.contains(" ")) {
      setState(() {
        secondAlphabet = name[name.indexOf(" ") + 1];
      });
    }

    initals = firstAlphabet + secondAlphabet;
    return initals.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                    color: kRepliedMessageColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  getContactInitial(),
                  style: const TextStyle(
                      color: kFloatingbtnColor,
                      fontFamily: "Satoshi",
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.contactName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Satoshi"),
                    ),
                    Text(
                      widget.contacNumber,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.72),
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Satoshi"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
