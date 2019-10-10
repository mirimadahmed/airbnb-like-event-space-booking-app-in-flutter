import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../environment_variable.dart';

class Listing extends StatelessWidget {
  final String image, name;
  Listing({this.image,this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.grey.withOpacity(0.1),
          width: 192,
          height: 108,
//          child: image == null ? Image.network("https://picsum.photos/250?image=",fit: BoxFit.fill,) : Image.network(image,fit: BoxFit.fill,),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: image,
          fit: BoxFit.fill,
        ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
              width: 192,
              child: Text(name ?? " ",
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
