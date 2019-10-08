import 'package:flutter/material.dart';

import '../environment_variable.dart';

class BookingApcaeFoield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  BookingApcaeFoield({this.controller, this.labelText, this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
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
