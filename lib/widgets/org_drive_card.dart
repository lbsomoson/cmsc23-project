import 'package:flutter/material.dart';
import 'package:project/widgets/text3.dart';

class OrgDriveCard extends StatefulWidget {
  const OrgDriveCard({super.key});

  @override
  State<OrgDriveCard> createState() => _OrgDriveCardState();
}

class _OrgDriveCardState extends State<OrgDriveCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/dog.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Help Animal Sanctuary",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(22, 57, 30, 1),
                      )),
                  const SizedBox(height: 5),
                  const Text3Widget(
                    text1: "₱41",
                    text2: "Fund raised",
                  ),
                  Text3Widget(
                    text1: 21.toString(),
                    text2: 21 > 1 ? "Donors" : "Donor",
                  ),
                  Text3Widget(
                    text1: 4.toString(),
                    text2: 4 > 1 ? "Days" : "Day",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
