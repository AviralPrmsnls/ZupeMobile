import 'package:flutter/material.dart';

class TitleDescriptionOptionCard extends StatefulWidget {
  TitleDescriptionOptionCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.w,
      required this.ontap})
      : super(key: key);

  final double w;
  void Function()? ontap;
  String description;
  String title;

  @override
  State<TitleDescriptionOptionCard> createState() =>
      _TitleDescriptionOptionCardState();
}

class _TitleDescriptionOptionCardState
    extends State<TitleDescriptionOptionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: widget.ontap,
        child: Container(
          height: 50,
          width: widget.w,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Text(
                  widget.description,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
