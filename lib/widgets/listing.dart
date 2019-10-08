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
          child:Image.network("https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true",fit: BoxFit.fill,),
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
