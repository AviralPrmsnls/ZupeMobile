import 'package:flutter/material.dart';

class SingleTitleOptionCard extends StatefulWidget {
  SingleTitleOptionCard(
      {Key? key, required this.text, required this.w, required this.ontap})
      : super(key: key);

  final double w;
  void Function()? ontap;
  String text;

  @override
  State<SingleTitleOptionCard> createState() => _SingleTitleOptionCardState();
}

class _SingleTitleOptionCardState extends State<SingleTitleOptionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
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
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
