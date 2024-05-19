import 'package:flutter/material.dart';

class Text3Widget extends StatefulWidget {
  final String text1, text2;
  final double size;
  const Text3Widget({
    required this.text1,
    required this.text2,
    required this.size,
    super.key,
  });

  @override
  State<Text3Widget> createState() => _Text3WidgetState();
}

class _Text3WidgetState extends State<Text3Widget> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.text1,
            style: TextStyle(
              fontSize: widget.size,
              fontFamily: 'Inter',
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(width: 5),
          ),
          TextSpan(
            text: widget.text2,
            style: TextStyle(
              fontSize: widget.size,
              fontFamily: 'Inter',
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      overflow: TextOverflow.visible,
      maxLines: 2,
      softWrap: true,
    );
  }
}
