import 'package:flutter/material.dart';

import '../environment_variable.dart';

class BookingSpaceField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  final TextInputType inputType;
  BookingSpaceField({this.controller, this.labelText, this.hintText, this.inputType});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        cursorColor: Environment.textColor,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold),
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
