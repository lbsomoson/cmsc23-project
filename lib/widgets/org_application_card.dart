import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/screens/admin/admin_approval.dart';
import 'package:project/widgets/button.dart';

class OrgApplicationCard extends StatefulWidget {
  final Organization org;
  const OrgApplicationCard({required this.org, super.key});

  @override
  State<OrgApplicationCard> createState() => _OrgApplicationCardState();
}

class _OrgApplicationCardState extends State<OrgApplicationCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth / 1.75;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: cardWidth,
          child: Card(
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
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.org.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercita.",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          )),
                      const SizedBox(height: 5),
                      ButtonWidget(
                        handleClick: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AdminApprovalScreen(org: widget.org);
                          }));
                        },
                        size: 38,
                        block: true,
                        label: "Review",
                        style: "filled",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
