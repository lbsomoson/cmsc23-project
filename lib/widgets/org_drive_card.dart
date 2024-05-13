import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/widgets/text.dart';

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
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Help Animal Sanctuary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(22, 57, 30, 1),
                        fontFamily: 'Inter',
                      )),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
