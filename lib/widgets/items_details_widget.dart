import 'package:flutter/material.dart';


class ItemsDeailsWidget extends StatelessWidget {
  final String name, rate, image;
  final IconData icon;
  ItemsDeailsWidget({this.name, this.icon, this.image, this.rate});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .2,
          color: Colors.grey,
          child: Image.network("https://picsum.photos/250?image=9",fit: BoxFit.cover,),
        ),
        Text(name ?? "Name",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        Row(
          children: <Widget>[
            Icon(icon ?? Icons.star_border),
            Text(rate ?? "100",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),
      ],
    );
  }
}
