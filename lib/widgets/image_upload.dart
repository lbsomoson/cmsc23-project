import 'package:flutter/material.dart';

class ImageUploadWidget extends StatefulWidget {
  final String label, instruction;
  const ImageUploadWidget(
      {required this.instruction, required this.label, super.key});

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.label,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: const Color.fromRGBO(3, 198, 185, 0.296),
          onTap: () {
            // TODO: Open image from gallery, ask permission
          },
          child: Container(
            padding: const EdgeInsets.all(25),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.grey[500],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Upload proof of legitimacy",
                  style: TextStyle(color: Colors.grey[500], fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
