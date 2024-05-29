import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';

class DonorDonationForm extends StatefulWidget {
  const DonorDonationForm({Key? key}) : super(key: key);

  @override
  State<DonorDonationForm> createState() => _DonorDonationFormState();
}

class _DonorDonationFormState extends State<DonorDonationForm> {
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
