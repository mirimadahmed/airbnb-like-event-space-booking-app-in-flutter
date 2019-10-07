import 'package:flutter/material.dart';

import '../environment_variable.dart';

class Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 192,
          height: 108,
          child:Image.network("https://spacesly.s3.amazonaws.com/media/Howdy-Gol-Market-1_74pC7Tj.JPG?AWSAccessKeyId=AKIAWCQQ7RP4RUYBWSF2&Signature=2QZ7AaiSOwRf9gqbn3lC%2F131tS4%3D&Expires=1570454199",fit: BoxFit.fill,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              width: 192,
              child: Text("Name of listing name of string name of string",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Environment.textColor))),
        ),
        Row(
          children: <Widget>[
            Icon(Icons.people),
            Text("300", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Environment.textColor))
          ],
        )
      ],
    );
  }
}
