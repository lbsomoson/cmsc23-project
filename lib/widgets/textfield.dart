import 'package:flutter/material.dart';
import 'package:project/widgets/text.dart';

class TextFieldWidget extends StatefulWidget {
  final Function callback;
  final String hintText, type;
  final String? label, initialValue;
  final bool? isRequired;
  final int? maxLines;
  const TextFieldWidget(
      {required this.callback,
      this.label,
      this.initialValue,
      this.isRequired,
      this.maxLines,
      required this.hintText,
      required this.type,
      super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final RegExp regExp = RegExp(r'[\d]+'); // regex for numbers

  TextInputType textInputTypeFromString(String input) {
    //Dynamic keyboard type for fields
    switch (input) {
      case 'String':
        return TextInputType.text;
      case 'Number':
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        TextFormField(
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
            fontSize: 16,
          ),
          onSaved: (value) {},
          initialValue: widget.initialValue,
          validator: (value) {
            // asks for a value if the textfield is empty
            if (value == null || value.isEmpty) {
              return "Please enter your ${widget.label?.toLowerCase()}";
            }
            // if the type is a string, it checks if the value is a string
            if (widget.type == "String" && regExp.hasMatch(value)) {
              return "Please enter valid text";
            }
            return null;
          },
          maxLines: widget.maxLines ?? 1,
          onChanged: (value) => {if (value.isNotEmpty) widget.callback(value)},
          obscureText: widget.type == "Password",
          keyboardType: textInputTypeFromString(widget.type),
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 1.5),
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
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
