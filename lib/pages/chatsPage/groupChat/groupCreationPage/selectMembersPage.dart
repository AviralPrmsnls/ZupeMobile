import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zupe/pages/chatsPage/groupChat/groupCreationPage/confirmGroupPage.dart';
import 'package:zupe/provider/selectedGroupContact.dart';
import 'package:zupe/widgets/CircularRadioBtn.dart';

class SelectMembersPage extends StatefulWidget {
  const SelectMembersPage({super.key});

  @override
  State<SelectMembersPage> createState() => _SelectMembersPageState();
}

class _SelectMembersPageState extends State<SelectMembersPage> {
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
              fontSize: 22, fontFamily: "Satoshi", fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: InkWell(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmGroupPage()),
              );
            });
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: kRepliedMessageColor,
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
              child: Icon(
                Icons.arrow_forward,
                color: kFloatingbtnColor,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: kAppBarPrimaryColor,
      body: SizedBox(
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: w - 50,
              height: 50,
              child: TextFormField(
                controller: contactController,
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                autofocus: false,
                cursorColor: Colors.white,
                style: const TextStyle(
                    fontFamily: "Satoshi",
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                        right: 10,
                      ),
                      child: Container(
                        width: 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/keypad.png",
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    hintText: "Message",
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.72),
                        fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: kRepliedMessageColor, width: 1.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: kRepliedMessageColor, width: 1.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: kRepliedMessageColor, width: 1.0),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    fillColor: kRepliedMessageColor,
                    filled: true),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            if (Provider.of<SelectGroupContactProvider>(context)
                .getContactForGroup
                .isNotEmpty)
              SizedBox(
                width: w,
                height: 32,
                child: ListView(
                  // reverse: true,
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    for (var contact
                        in Provider.of<SelectGroupContactProvider>(context)
                            .getContactForGroup)
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          // height: 30,
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                              color: kRepliedMessageColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                contact,
                                style: const TextStyle(
                                    fontFamily: "Satoshi",
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Provider.of<SelectGroupContactProvider>(
                                                context,
                                                listen: false)
                                            .removePhoneForGroup =
                                        Provider.of<SelectGroupContactProvider>(
                                                context,
                                                listen: false)
                                            .getPhoneForGroup
                                            .first;
                                    Provider.of<SelectGroupContactProvider>(
                                            context,
                                            listen: false)
                                        .removeContactFromGroup = contact;
                                  });
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: kFloatingbtnColor,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (!isContactShow)
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  getContact();
                },
                child: Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      color: kRepliedMessageColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      "Show Contacts",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 13,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            if (isContactShow)
              Expanded(
                child: SingleChildScrollView(child: createContactList(w)),
              )
            // if (isContactShow) createContactList(w)
          ],
        ),
      ),
    );
  }

  Widget createContactList(w) {
    var initialsAppeared = <String>{};
    return Column(children: [
      for (int i = 0; i < name.length; i++) create(w, i, initialsAppeared)
    ]);
  }

  ContactList create(double w, int i, Set<String> initialsAppeared) {
    bool isnew = false;

    name.sort();

    if (initialsAppeared.contains(name[i][0])) {
      setState(() {
        isnew = false;
      });
    } else {
      setState(() {
        initialsAppeared.add(name[i][0]);
        isnew = true;
      });
    }

    return ContactList(
      contactName: name[i],
      phoneNumber: phoneNumber[i],
      isNew: isnew,
      init: name[i][0],
      w: w,
      contactvalue: contactvalue,
      index: i,
    );
  }
}

class ContactList extends StatefulWidget {
  ContactList({
    Key? key,
    required this.isNew,
    required this.w,
    required this.index,
    required this.contactName,
    required this.phoneNumber,
    required this.init,
    required this.contactvalue,
  }) : super(key: key);
  String init;
  String contactName;
  String phoneNumber;
  final double w;
  bool isNew;
  final int contactvalue;
  int index;

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return widget.isNew
        ? Container(
            width: widget.w,
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, bottom: 0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contactName[0],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Satoshi"),
                ),
                ContactCard(
                  index: widget.index,
                  contactName: widget.contactName,
                  contactValue: widget.contactvalue,
                  contacNumber: widget.phoneNumber,
                ),
              ],
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20, bottom: 0, top: 0),
            child: ContactCard(
              index: widget.index,
              contactName: widget.contactName,
              contactValue: widget.contactvalue,
              contacNumber: widget.phoneNumber,
            ),
          );
  }
}

class ContactCard extends StatefulWidget {
  ContactCard(
      {super.key,
      required this.contactValue,
      required this.contactName,
      required this.index,
      required this.contacNumber});
  int contactValue;
  String contactName;
  String contacNumber;
  int index;
  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
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
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
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
          CircularRadioBtn(
            value: Provider.of<SelectGroupContactProvider>(context)
                    .getContactForGroup
                    .contains(widget.contactName)
                ? widget.contactValue
                : widget.index,
            groupValue: widget.contactValue,
            onChanged: (val) {
              if (widget.contactValue != widget.index) {
                setState(() {
                  widget.contactValue = widget.index;
                  Provider.of<SelectGroupContactProvider>(context,
                          listen: false)
                      .setPhoneForGroup = widget.contacNumber;
                  Provider.of<SelectGroupContactProvider>(context,
                          listen: false)
                      .setContactForGroup = widget.contactName;
                });
              } else {
                setState(() {
                  print("hiiiii");
                  widget.contactValue = -1;
                  Provider.of<SelectGroupContactProvider>(context,
                          listen: false)
                      .removePhoneForGroup = widget.contacNumber;
                  Provider.of<SelectGroupContactProvider>(context,
                          listen: false)
                      .removeContactFromGroup = widget.contactName;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
