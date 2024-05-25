import 'package:flutter/material.dart';
import 'package:project/widgets/text.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(String) callback;
  final String hintText;
  final String? label;
  final DateTime? initialValue;
  final bool? isRequired;
  const DatePickerWidget({
    required this.callback,
    this.label,
    this.initialValue,
    this.isRequired,
    required this.hintText,
    super.key,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final TextEditingController _controller = TextEditingController();
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue ?? DateTime.now();
    _controller.text = "";
  }

  Future<void> _selectDate(BuildContext context) async {
    // TODO: do not allow user to pick dates from the past
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          child: child ?? Container(),
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = "${picked.month}/${picked.day}/${picked.year}";
      });
      widget.callback(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.label == null
            ? Container()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        TextWidget(text: widget.label!, style: 'titleSmall'),
                        const SizedBox(
                          width: 3,
                        ),
                        widget.isRequired != null
                            ? Text("*",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary))
                            : Container()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: AbsorbPointer(
            child: TextFormField(
              readOnly: true,
              controller: _controller,
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                fontSize: 16,
              ),
              onSaved: (value) {},
              validator: (value) {
                // asks for a value if the textfield is empty
                if (value == null || value.isEmpty) {
                  return "Please enter your ${widget.label?.toLowerCase()}";
                }
                return null;
              },
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.labelMedium,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
