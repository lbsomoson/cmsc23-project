import 'package:flutter/material.dart';

class ButtonSmallWidget extends StatefulWidget {
  final Function handleClick;
  final String label, style;
  final double? size;
  final bool block;
  final Icon? icon;
  const ButtonSmallWidget(
      {required this.handleClick,
      required this.block,
      this.size,
      this.icon,
      required this.label,
      required this.style,
      super.key});

  @override
  State<ButtonSmallWidget> createState() => _ButtonSmallWidgetState();
}

class _ButtonSmallWidgetState extends State<ButtonSmallWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.block ? double.infinity : widget.size,
      child: widget.style == "outlined"
          ? Container(
              height: widget.size ?? 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: .8,
                ),
              ),
              child: OutlinedButton(
                onPressed: () {
                  widget.handleClick();
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  side: BorderSide.none,
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null) ...[
                        widget.icon!,
                        SizedBox(width: 4),
                      ],
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ]),
              ))
          : Container(
              height: widget.size ?? 21,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.primary,
                      ])),
              child: ElevatedButton(
                onPressed: () {
                  widget.handleClick();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      widget.icon!,
                      SizedBox(width: 4),
                    ],
                    Text(
                      widget.label,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
