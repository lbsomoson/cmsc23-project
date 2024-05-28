import 'package:flutter/material.dart';
import 'package:project/widgets/text2.dart';

class AdminDonorCard extends StatelessWidget {
  final String name, id;
  const AdminDonorCard({required this.name, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text2Widget(text: name, style: "body4"),
                  Text(
                    id,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
