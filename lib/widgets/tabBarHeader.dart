import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';
import 'package:zupe/service/provider.dart';

class TabBarHeader extends StatefulWidget {
  TabBarHeader({super.key, required this.tabNumber, required this.text});
  int tabNumber;
  String text;

  @override
  State<TabBarHeader> createState() => _TabBarHeaderState();
}

class _TabBarHeaderState extends State<TabBarHeader> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        setState(() {
          Provider.of<TabBarProvider>(context, listen: false).SelectPage =
              widget.tabNumber;
        });
      },
      child: SizedBox(
        height: 40,
        width: w * .33,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                    fontSize: 15,
                    color: Provider.of<TabBarProvider>(context).selectPage ==
                            widget.tabNumber
                        ? Colors.white
                        : const Color.fromARGB(210, 255, 255, 255),
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4),
                child: Container(
                  height: 4,
                  width: w,
                  decoration: BoxDecoration(
                      color: Provider.of<TabBarProvider>(context).selectPage ==
                              widget.tabNumber
                          ? Colors.white
                          : kAppBarPrimaryColor,
                      borderRadius: BorderRadius.circular(4)),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
