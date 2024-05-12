import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  final String icon, label;
  final bool block;
  final Function callback;
  const IconButtonWidget(
      {required this.callback,
      required this.block,
      required this.icon,
      required this.label,
      super.key});

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 1.5)),
      child: SizedBox(
        height: 45,
        width: widget.block ? double.infinity : null,
        child: TextButton.icon(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color?>(Colors.transparent),
            ),
            onPressed: () {
              widget.callback();
            },
            label: Text(
              widget.label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            icon: Image.asset(
              widget.icon,
              width: 20,
              height: 20,
            )),
      ),
    );
  }
}
