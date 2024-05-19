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
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/images/juan.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
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
