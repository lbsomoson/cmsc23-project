import 'package:flutter/material.dart';

class ImageUpload2Widget extends StatefulWidget {
  const ImageUpload2Widget({super.key});

  @override
  State<ImageUpload2Widget> createState() => _ImageUpload2WidgetState();
}

class _ImageUpload2WidgetState extends State<ImageUpload2Widget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: const Color.fromRGBO(3, 198, 185, 0.296),
      onTap: () {
        // TODO: Open image from gallery, ask permission
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
              border: Border.all(width: 2, color: Colors.grey[300]!)),
          child: Center(
            child: Icon(
              Icons.add,
              size: 50,
              color: Colors.grey[400],
            ),
          )),
    );
  }
}
