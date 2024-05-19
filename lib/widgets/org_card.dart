import 'package:flutter/material.dart';
import 'package:project/widgets/text3.dart';

class OrgCard extends StatefulWidget {
  const OrgCard({super.key});

  @override
  State<OrgCard> createState() => _OrgCardState();
}

class _OrgCardState extends State<OrgCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/view-donation-drive');
      },
      child: Card(
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
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'assets/images/org logo.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Metropawlitan",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(22, 57, 30, 1),
                        )),
                    const SizedBox(height: 8),
                    const Text3Widget(
                      size: 14,
                      text1: "Category of Organization",
                      text2: "",
                    ),
                    const SizedBox(height: 10),
                    Text3Widget(
                      size: 14,
                      text1: 21.toString(),
                      text2: 21 > 1 ? "donation drives" : "donation drives",
                    ),
                    Text3Widget(
                      size: 14,
                      text1: 1000.toString(),
                      text2: 1000 > 1 ? "donors" : "donor",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
