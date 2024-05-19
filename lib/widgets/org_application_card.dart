import 'package:flutter/material.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/text2.dart';

class OrgApplicationCard extends StatefulWidget {
  const OrgApplicationCard({super.key});

  @override
  State<OrgApplicationCard> createState() => _OrgApplicationCardState();
}

class _OrgApplicationCardState extends State<OrgApplicationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 250, 242, 242),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'assets/images/org logo.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Metropawlitan",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Lorem ipsum dolor sit amet, adipiscing elit, sed doasd eiusmod tempor incididunt ut labore dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercita.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 5),
                ButtonWidget(
                  handleClick: () {},
                  size: 40,
                  block: true,
                  label: "Review",
                  style: "filled",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
