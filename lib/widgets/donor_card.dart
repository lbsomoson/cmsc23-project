import 'package:flutter/material.dart';
import 'package:project/widgets/text2.dart';

class DonorCard extends StatelessWidget {
  final String name;
  const DonorCard({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipOval(
              child: Image.asset(
                'assets/images/Male User.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: Text2Widget(text: name, style: "body"),
          )
        ],
      ),
    );
  }
}
