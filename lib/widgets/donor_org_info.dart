import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/widgets/text2.dart';

class DonorOrgInfo extends StatefulWidget {
  final Organization org;
  const DonorOrgInfo({required this.org, super.key});

  @override
  State<DonorOrgInfo> createState() => _DonorOrgInfoState();
}

class _DonorOrgInfoState extends State<DonorOrgInfo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text2Widget(text: widget.org.name, style: "bodyMedium"),
                      Row(
                        children: [
                          SizedBox(
                            width: 2,
                          ),
                          Text2Widget(
                              text: "Organization Category", style: "body6")
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
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
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Theme.of(context).colorScheme.primary,
                              size: 10),
                          SizedBox(
                            width: 5,
                          ),
                          Text2Widget(
                              text: widget.org.addresses[0], style: "body6")
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,
                              color: Theme.of(context).colorScheme.primary,
                              size: 10),
                          SizedBox(
                            width: 5,
                          ),
                          Text2Widget(
                              text: widget.org.contactNumber, style: "body6")
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.email,
                              color: Theme.of(context).colorScheme.primary,
                              size: 10),
                          SizedBox(
                            width: 5,
                          ),
                          Text2Widget(text: widget.org.email, style: "body6")
                        ],
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
