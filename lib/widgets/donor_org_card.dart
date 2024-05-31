import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/screens/donor/donor_orgview.dart';
import 'package:project/widgets/org_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/admin_provider.dart';

class DonorOrgCard extends StatefulWidget {
  final Organization org;
  const DonorOrgCard({required this.org, super.key});

  @override
  State<DonorOrgCard> createState() => _DonorOrgCardState();
}

class _DonorOrgCardState extends State<DonorOrgCard> {
  Future<int>? _donationsCount;
  @override
  Widget build(BuildContext context) {
    _donationsCount = context
        .watch<AdminProvider>()
        .getDonationsCountByOrgId(widget.org.organizationId!);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DonorOrgView(org: widget.org);
        }));
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
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/Rectangle 34.png',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.org.name,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(22, 57, 30, 1),
                        )),
                    Row(
                      children: [
                        const SizedBox(
                          width: 2,
                        ),
                        const Text2Widget(
                            text: "Organization Category", style: "body6")
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: Text2Widget(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,",
                            style: "body5",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Theme.of(context).colorScheme.primary,
                            size: 10),
                        const SizedBox(
                          width: 5,
                        ),
                        Text2Widget(
                            text: widget.org.addresses[0], style: "body6")
                      ],
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
