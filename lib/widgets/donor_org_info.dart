import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/text2.dart';

class DonorOrgInfo extends StatelessWidget {
  const DonorOrgInfo({super.key});

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
                      Text2Widget(
                          text: "Cats of UPLB", style: "bodyMedium"),
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
                          Text2Widget(text: "Los Baños, Laguna", style: "body6")
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
                          Text2Widget(text: "09123456789", style: "body6")
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
                          Text2Widget(
                              text: "cats.uplb@gmail.com", style: "body6")
                        ],
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
