import 'dart:ui';

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String labelText;
  final String warningText;
  final IconData icon;
  final int minLength;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isSecret;
  const TextWidget({
    Key key,
    @required this.labelText,
    this.warningText,
    this.minLength,
    @required this.controller,
    this.inputType,
    this.icon,
    this.isSecret,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecret ?? false,
      decoration: new InputDecoration(
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: Colors.green[700],
                )
              : null,
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.green[500],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          fillColor: Colors.green),
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
