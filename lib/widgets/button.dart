import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final Function handleClick;
  final String label, style;
  final bool block;
  const ButtonWidget(
      {required this.handleClick,
      required this.block,
      required this.label,
      required this.style,
      super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.block ? double.infinity : null,
      child: widget.style == "outlined"
          // TODO: Add a container here
          ? OutlinedButton(
              onPressed: () {
                widget.handleClick();
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ))
          : Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary
                      ])),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Text(
                  widget.label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
    );
  }
}
