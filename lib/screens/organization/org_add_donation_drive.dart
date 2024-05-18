import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/datepicker.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/image_upload2.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';

class OrgAddDonationDriveScreen extends StatefulWidget {
  const OrgAddDonationDriveScreen({super.key});

  @override
  State<OrgAddDonationDriveScreen> createState() =>
      _OrgAddDonationDriveScreenState();
}

class _OrgAddDonationDriveScreenState extends State<OrgAddDonationDriveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Create Donation Drive"),
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
                  callback: () {},
                  hintText: "Title",
                  type: "String",
                  label: "Title",
                  isRequired: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  callback: () {},
                  hintText: "Name of Recipient",
                  type: "String",
                  label: "Name of Recipient",
                  isRequired: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  callback: () {},
                  hintText: "Usage Plan",
                  type: "String",
                  maxLines: 5,
                  label: "Usage Plan",
                  isRequired: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                DatePickerWidget(
                  callback: () {},
                  hintText: "Date of Expiration",
                  isRequired: true,
                  label: "Date of Expiration",
                ),
                const DividerWidget(),
                const Text2Widget(text: "Upload Image", style: "sectionHeader"),
                const SizedBox(
                  height: 10,
                ),
                const ImageUpload2Widget(),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    handleClick: () {},
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
