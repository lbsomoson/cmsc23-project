import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../widgets/datepicker.dart';
import '../../widgets/image_upload2.dart';

class DonorDonationForm extends StatefulWidget {
  const DonorDonationForm({Key? key}) : super(key: key);

  @override
  State<DonorDonationForm> createState() => _DonorDonationFormState();
}

class _DonorDonationFormState extends State<DonorDonationForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> _selectedTypes = [];
  bool isPickUp = true;

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

  Widget get noDateMessage => Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          errorMessage2!,
          style: const TextStyle(
              color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Donation Form"),
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
                    SizedBox(height: 10),
                    const Text2Widget(
                      text: "Choose items to donate",
                      style: "titleSmall",
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text2Widget(text: 'Cash', style: 'labelMedium'),
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
                      title: Text2Widget(text: 'Food', style: 'labelMedium'),
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
                      title: Text2Widget(text: 'Clothes', style: 'labelMedium'),
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
                      title: Text2Widget(
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
                      title: Text2Widget(text: 'Others', style: 'labelMedium'),
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
                    SizedBox(height: 10),
                    TextFieldWidget(
                      callback: (String val) => addDonation['weight'] = val,
                      hintText: "Weight",
                      type: "String",
                      label: "Weight of items to donate in kg/lbs",
                      isRequired: true,
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
                    DividerWidget(),
                    DatePickerWidget(
                      callback: (String val) => {
                        addDonation['date'] = val,
                        setState(() {
                          showDateMessage = false;
                        })
                      },
                      hintText: "Date of Pickup/Dropoff",
                      isRequired: true,
                      label: "Date of Pickup/Dropoff",
                    ),
                    showDateMessage
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              noDateMessage,
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text2Widget(
                        text: "Choose Mode of Transfer",
                        style: "sectionHeader"),
                    SizedBox(
                      height: 50,
                      child: ToggleSwitch(
                        minWidth: 250.0,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          const [Color.fromRGBO(62, 218, 134, 1)],
                          const [Color.fromRGBO(62, 218, 134, 1)]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: isPickUp ? 0 : 1,
                        totalSwitches: 2,
                        labels: ['Pick Up', 'Drop Off'],
                        radiusStyle: true,
                        onToggle: (index) {
                          setState(() {
                            isPickUp = index == 0;
                          });
                        },
                      ),
                    ),
                    if (isPickUp) ...[
                      TextFieldWidget(
                        callback: (String val) => addDonation['address'] = val,
                        hintText: "Address",
                        type: "String",
                        label: "Address",
                        isRequired: true,
                      ),
                      TextFieldWidget(
                        callback: (String val) =>
                            addDonation['contactNumber'] = val,
                        hintText: "Contact Number",
                        type: "Number",
                        label: "Contact Number",
                        isRequired: true,
                      ),
                    ],
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
