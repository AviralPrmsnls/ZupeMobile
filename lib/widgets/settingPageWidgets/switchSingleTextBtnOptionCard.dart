import 'package:flutter/material.dart';

class SwitchSingleBtnSettingsOptionCard extends StatefulWidget {
  SwitchSingleBtnSettingsOptionCard({
    super.key,
    required this.header,
    required this.isSelect,
    required this.ontap,
  });
  bool isSelect;
  void Function()? ontap;
  String header;

  @override
  State<SwitchSingleBtnSettingsOptionCard> createState() =>
      _SwitchSingleBtnSettingsOptionCardState();
}

class _SwitchSingleBtnSettingsOptionCardState
    extends State<SwitchSingleBtnSettingsOptionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: InkWell(
        onTap: widget.ontap,
        child: Container(
          // width: w,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.header,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Switch(
                  // thumb color (round icon)
                  activeColor: Color.fromRGBO(173, 255, 0, 1),
                  activeTrackColor: Color.fromRGBO(173, 255, 0, .3),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.white24,
                  splashRadius: 50.0,
                  value: widget.isSelect,
                  onChanged: (value) =>
                      setState(() => widget.isSelect = value)),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
