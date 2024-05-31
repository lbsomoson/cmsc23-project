import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/image_upload2.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';

class ViewDonation extends StatefulWidget {
  const ViewDonation({super.key});

  @override
  State<ViewDonation> createState() => _ViewDonationState();
}

class _ViewDonationState extends State<ViewDonation> {
  final _formKey = GlobalKey<FormState>();
  List<String> _selectedTypes = [];

  late Map<String, dynamic> addDonation = {
    'types': [],
    'weight': '',
    'file': null,
    'date': '',
    'address': '',
    'contactNumber': ''
  };
  String? errorMessage, errorMessage2;
  bool showImageUploadMessage = false, showDateMessage = false;

  Widget get imageUploadMessage => Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          errorMessage!,
          style: const TextStyle(
              color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: UPDATE NAME OF DONOR
        title: const AppBarTitle(title: "Donor Name"),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text2Widget(
                      text: "Fill out the donation form",
                      style: "sectionHeader",
                    ),
                    const SizedBox(height: 10),
                    const Text2Widget(
                      text: "Choose items to donate",
                      style: "titleSmall",
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title:
                          const Text2Widget(text: 'Cash', style: 'labelMedium'),
                      value: _selectedTypes.contains('Cash'),
                      onChanged: (checked) {
                        setState(() {
                          if (checked!) {
                            _selectedTypes.add('Cash');
                          } else {
                            _selectedTypes.remove('Cash');
                          }
                          addDonation['types'] = _selectedTypes;
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title:
                          const Text2Widget(text: 'Food', style: 'labelMedium'),
                      value: _selectedTypes.contains('Food'),
                      onChanged: (checked) {
                        setState(() {
                          if (checked!) {
                            _selectedTypes.add('Food');
                          } else {
                            _selectedTypes.remove('Food');
                          }
                          addDonation['types'] = _selectedTypes;
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title: const Text2Widget(
                          text: 'Clothes', style: 'labelMedium'),
                      value: _selectedTypes.contains('Clothes'),
                      onChanged: (checked) {
                        setState(() {
                          if (checked!) {
                            _selectedTypes.add('Clothes');
                          } else {
                            _selectedTypes.remove('Clothes');
                          }
                          addDonation['types'] = _selectedTypes;
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title: const Text2Widget(
                          text: 'Necessities', style: 'labelMedium'),
                      value: _selectedTypes.contains('Necessities'),
                      onChanged: (checked) {
                        setState(() {
                          if (checked!) {
                            _selectedTypes.add('Necessities');
                          } else {
                            _selectedTypes.remove('Necessities');
                          }
                          addDonation['types'] = _selectedTypes;
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      title: const Text2Widget(
                          text: 'Others', style: 'labelMedium'),
                      value: _selectedTypes.contains('Others'),
                      onChanged: (checked) {
                        setState(() {
                          if (checked!) {
                            _selectedTypes.add('Others');
                          } else {
                            _selectedTypes.remove('Others');
                          }
                          addDonation['types'] = _selectedTypes;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      callback: (String val) => addDonation['weight'] = val,
                      hintText: "Weight",
                      type: "Number",
                      label: "Weight of items to donate in kg/lbs",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text2Widget(
                        text: "Upload Image", style: "sectionHeader"),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageUpload2Widget(
                      callBack: (String path, File file) => {
                        addDonation['file'] = file,
                        addDonation['path'] = path,
                        setState(() {
                          showImageUploadMessage = false;
                        })
                      },
                    ),
                    showImageUploadMessage
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              imageUploadMessage,
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      callback: (String val) => addDonation['address'] = val,
                      hintText: "Address",
                      type: "String",
                      label: "Address",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      callback: (String val) =>
                          addDonation['contactNumber'] = val,
                      hintText: "Contact Number",
                      type: "Number",
                      label: "Contact Number",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                        handleClick: () {},
                        block: true,
                        label: "Approve",
                        style: 'filled'),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
