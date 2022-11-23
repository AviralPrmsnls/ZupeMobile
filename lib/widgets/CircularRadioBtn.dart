import 'package:flutter/material.dart';
import 'package:zupe/constant/constant.dart';

class CircularRadioBtn extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;
  const CircularRadioBtn(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _CircularRadioBtnState createState() => _CircularRadioBtnState();
}

class _CircularRadioBtnState extends State<CircularRadioBtn> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
        onTap: () => widget.onChanged(widget.value),
        child: Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: kFloatingbtnColor),
              // color: selected ? kPrimaryColor : Colors.transparent),
            ),
            child: Center(
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(width: 2, color: Colors.black),
                    color: selected ? kFloatingbtnColor : Colors.transparent),
              ),
            )));
  }
}
