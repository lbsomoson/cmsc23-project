import 'package:flutter/material.dart';
import 'package:project/providers/org_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/datepicker.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/image_upload2.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:provider/provider.dart';

class OrgEditDonationDriveScreen extends StatefulWidget {
  // final Map<String, dynamic> drive;
  final DonationDrive drive;
  const OrgEditDonationDriveScreen({required this.drive, super.key});

  @override
  State<OrgEditDonationDriveScreen> createState() =>
      _OrgEditDonationDriveScreenState();
}

class _OrgEditDonationDriveScreenState
    extends State<OrgEditDonationDriveScreen> {
  // Map<String, dynamic> drive = {
  //   'title': "Help Animal Sanctuary",
  //   'expirationDate': DateTime.now(),
  //   'usagePlan':
  //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  //   'recipient': "Mama’s Cradle Animal Sanctuary",
  //   'photo': ""
  // };

  void editValues(Map<String, dynamic> toEdit,String title, String plan, String recipient){
    toEdit['title'] = title;
    toEdit['usagePlan'] = plan;
    toEdit['recipient'] = recipient; 
  }

  String? title, plan, recipient;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> newDrive = {'title':widget.drive.title, 'usagePlan':widget.drive.plan, 'recipient':widget.drive.recipient,'status':widget.drive.status,};

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: "Edit ${widget.drive.title}"),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text2Widget(text: "Details", style: "sectionHeader"),
                TextFieldWidget(
                  initialValue: widget.drive.title,
                  callback: (String val)  => title = val,
                  hintText: "Title",
                  type: "String",
                  label: "Title",
                  isRequired: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  initialValue: widget.drive.recipient,
                  callback: (String val)  => recipient = val,
                  hintText: "Name of Recipient",
                  type: "String",
                  label: "Name of Recipient",
                  isRequired: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  initialValue: widget.drive.plan,
                  callback: (String val)  => plan = val,
                  hintText: "Usage Plan",
                  type: "String",
                  maxLines: 5,
                  label: "Usage Plan",
                  isRequired: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // DatePickerWidget(
                //   initialValue: drive['expirationDate'],
                //   callback: () {},
                //   hintText: "Date of Expiration",
                //   isRequired: true,
                //   label: "Date of Expiration",
                // ),
                const DividerWidget(),
                const Text2Widget(text: "Upload Image", style: "sectionHeader"),
                const SizedBox(
                  height: 10,
                ),
                // ImageUpload2Widget(
                //   callBack: (String path, File file) => {
                //     donationDrive['file'] = file,
                //     donationDrive['path'] = path,
                //   },
                // ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    handleClick: () {
                      editValues(newDrive, title!, plan!, recipient!);
                      context.read<OrgProvider>().editDonationDrive(widget.drive.driveId!, newDrive); print(newDrive['title']);},
                    block: true,
                    label: "Add",
                    style: 'filled'),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
