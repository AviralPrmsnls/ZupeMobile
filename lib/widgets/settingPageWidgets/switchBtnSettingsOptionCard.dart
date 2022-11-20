import 'package:flutter/material.dart';

class SwitchBtnSettingsOptionCard extends StatefulWidget {
  SwitchBtnSettingsOptionCard({
    super.key,
    required this.header,
    required this.description,
    required this.isSelect,
    required this.ontap,
  });
  bool isSelect;
  void Function()? ontap;
  String header;
  String description;
  @override
  State<SwitchBtnSettingsOptionCard> createState() =>
      _SwitchBtnSettingsOptionCardState();
}

class _SwitchBtnSettingsOptionCardState
    extends State<SwitchBtnSettingsOptionCard> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.header,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.description,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white60),
                          ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
