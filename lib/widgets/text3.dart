import 'package:flutter/material.dart';

class Text3Widget extends StatefulWidget {
  final String text1, text2;
  const Text3Widget({required this.text1, required this.text2, super.key});

  @override
  State<Text3Widget> createState() => _Text3WidgetState();
}

class _Text3WidgetState extends State<Text3Widget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text1,
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700)),
        const SizedBox(
          width: 5,
        ),
        Text(
          widget.text2,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
