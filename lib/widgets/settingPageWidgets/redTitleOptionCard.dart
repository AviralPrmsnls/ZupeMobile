import 'package:flutter/material.dart';

class RedTitleOptionCard extends StatefulWidget {
  RedTitleOptionCard(
      {Key? key, required this.text, required this.w, required this.ontap})
      : super(key: key);

  final double w;
  void Function()? ontap;
  String text;

  @override
  State<RedTitleOptionCard> createState() => _RedTitleOptionCardState();
}

class _RedTitleOptionCardState extends State<RedTitleOptionCard> {
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
            child: Text(
              widget.text,
              style: const TextStyle(
                  fontSize: 17,
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 220, 59, 47)),
            ),
          ),
        ),
      ),
    );
  }
}
