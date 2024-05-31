import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class QrCode extends StatelessWidget {
  final String donationId;
  const QrCode({required this.donationId, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: QrImageView(
        data: donationId,
        version: QrVersions.auto,
        size: 200.0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
