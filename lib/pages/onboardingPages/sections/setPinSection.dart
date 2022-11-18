import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zupe/constant/constant.dart';

class SetPinSection extends StatefulWidget {
  SetPinSection({
    Key? key,
  }) : super(key: key);

  @override
  State<SetPinSection> createState() => _SetPinSectionState();
}

class _SetPinSectionState extends State<SetPinSection> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Text(
        "zupe",
        style: TextStyle(
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w900,
            fontSize: 42,
            color: Color.fromRGBO(255, 255, 255, .7)),
      ),
      SizedBox(
        height: h * .06,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Create your",
            style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "PIN",
            style: TextStyle(
                fontFamily: "Satoshi",
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: kFloatingbtnColor),
          ),
        ],
      ),
      const SizedBox(
        height: 6,
      ),
      const Text(
        "Confirm your PIN",
        style: TextStyle(
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromRGBO(104, 104, 104, 1)),
      ),
      const SizedBox(
        height: 60,
      ),
      Container(
        width: w * .80,
        height: 40,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kFloatingbtnColor))),
        child: Center(
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            obscureText: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25, fontFamily: "Satoshi", color: kFloatingbtnColor),
            cursorColor: kFloatingbtnColor,
            decoration: const InputDecoration(
                hintText: '',
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
      )
    ]));
  }
}
