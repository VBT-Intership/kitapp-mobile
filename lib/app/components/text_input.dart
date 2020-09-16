import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String labelText;
  final String warningText;
  final IconData icon;
  final int minLength;
  final TextEditingController controller;
  final TextInputType inputType;
  const TextWidget({
    Key key,
    @required this.labelText,
    this.warningText,
    this.minLength,
    @required this.controller,
    this.inputType,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        labelText: labelText,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(),
        ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val.length <= minLength ?? 0) {
          return warningText;
        } else {
          return null;
        }
      },
      keyboardType: inputType ?? TextInputType.text,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }
}
