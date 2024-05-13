import 'package:flutter/material.dart';

class Text2Widget extends StatefulWidget {
  final String text, style;
  const Text2Widget({required this.text, required this.style, super.key});

  @override
  State<Text2Widget> createState() => _Text2WidgetState();
}

class _Text2WidgetState extends State<Text2Widget> {
  // screen title
  TextStyle bodyLarge = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(71, 187, 98, 1),
    fontFamily: 'Inter',
  );

  // title
  TextStyle bodyMedium = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(22, 57, 30, 1),
    fontFamily: 'Inter',
  );

  // caption
  TextStyle bodySmall = TextStyle(
    color: Colors.grey[500],
    fontSize: 16,
    fontFamily: 'Inter',
  );

  // text field helper
  TextStyle labelMedium = TextStyle(
    color: Colors.grey[500],
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  TextStyle titleSmall = TextStyle(
    color: Colors.grey[500],
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  // button
  TextStyle labelLarge = const TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: switch (widget.style) {
        'bodySmall' => bodySmall,
        'bodyMedium' => bodyMedium,
        'bodyLarge' => bodyLarge,
        'labelMedium' => labelMedium,
        'labelLarge' => labelLarge,
        'titleSmall' => titleSmall,
        _ => Theme.of(context).textTheme.bodyMedium,
      },
    );
  }
}
