import "package:flutter/material.dart";

import '../environment_variable.dart';



class HomeIconCard extends StatelessWidget {
  final String icon, text;
  final GestureTapCallback onPressed;
  HomeIconCard({this.onPressed,this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(4, 4), color: Color.fromRGBO(0, 0, 0, 0.25), blurRadius: 4)
        ],
          color: Environment.semiBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        onPressed:onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(icon), Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Environment.textColor),),
              )],
          ),
        ),
      ),
    );
  }
}
