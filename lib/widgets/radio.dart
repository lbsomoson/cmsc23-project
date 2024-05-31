import 'package:flutter/material.dart';
import 'package:project/widgets/text2.dart';

class CustomRadios extends StatefulWidget {
  final Function callback;
  const CustomRadios({required this.callback, super.key});

  @override
  State<CustomRadios> createState() => _CustomRadiosState();
}

class _CustomRadiosState extends State<CustomRadios> {
  static final Map<String, bool> _donationDriveTitles = {
    "Haters gonna hate": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don't talk to strangers when your mouth is full": false,
    "Let's burn the bridge when we get there": false
  };

  String radioValue = "Haters gonna hate";

  void resetRadio() {
    setState(() {
      radioValue = "Haters gonna hate";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _donationDriveTitles.entries.map((entry) {
        return RadioListTile<String>(
          dense: true,
          title: Text2Widget(text: entry.key, style: "body3"),
          value: entry.key.toString(),
          groupValue: radioValue,
          selected: entry.value,
          onChanged: (v) {
            setState(() {
              radioValue = v!;
            });
            widget.callback(radioValue);
          },
        );
      }).toList(),
    );
  }
}
