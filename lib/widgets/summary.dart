import 'package:flutter/material.dart';
import 'package:project/widgets/text2.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text2Widget(text: "Total donations", style: 'body'),
              Text2Widget(text: "250", style: 'body2')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text2Widget(text: "Total fund raised", style: 'body'),
              Text2Widget(text: "₱500,000", style: 'body2')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text2Widget(text: "Total food collected", style: 'body'),
              Text2Widget(text: "180", style: 'body2')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text2Widget(text: "Total clothes collected", style: 'body'),
              Text2Widget(text: "200", style: 'body2')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text2Widget(text: "Total necessities collected", style: 'body'),
              Text2Widget(text: "97", style: 'body2')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text2Widget(text: "Others", style: 'body'),
              Text2Widget(text: "70", style: 'body2')
            ],
          ),
        ],
      ),
    );
  }
}
