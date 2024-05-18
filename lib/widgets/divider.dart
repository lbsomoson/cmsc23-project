import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey[400],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
