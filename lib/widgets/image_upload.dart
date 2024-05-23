import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ImageUploadWidget extends StatefulWidget {
  final String label, instruction;
  final Function(String path, File file) callBack;
  const ImageUploadWidget(
      {required this.instruction,
      required this.label,
      required this.callBack,
      super.key});

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  PlatformFile? selectedFile;

  @override
  Widget build(BuildContext context) {
    User userId = context.read<UserAuthProvider>().user!;

    Future<bool> _requestGalleryPermission() async {
      final PermissionStatus permission = await Permission.photos.status;
      if (permission == PermissionStatus.granted) {
        return true;
      } else {
        final PermissionStatus permissionStatus =
            await Permission.photos.request();
        return permissionStatus == PermissionStatus.granted;
      }
    }

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
          onTap: () async {
            // TODO: ASK FOR PERMISSION
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg', 'png', 'HEIC'],
            );
            print(userId);
            if (result == null) return;
            setState(() {
              selectedFile = result.files.first;
            });
            final path = '/${userId.uid}/uploads/${result.files.first.name}';
            final file = File(selectedFile!.path!);

            widget.callBack(path, file);
          },
          child: Container(
            padding: selectedFile != null
                ? const EdgeInsets.all(0)
                : const EdgeInsets.all(25),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: selectedFile != null
                ? Image.file(
                    File(selectedFile!.path!),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Column(
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
