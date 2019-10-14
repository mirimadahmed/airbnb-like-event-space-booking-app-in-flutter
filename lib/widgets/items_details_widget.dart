import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


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
          height: MediaQuery.of(context).orientation == Orientation.portrait ?  MediaQuery.of(context).size.height * .4 : MediaQuery.of(context).size.height * .9,
          color: Colors.grey.withOpacity(0.3),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: image,
            fit: BoxFit.fill,
          ),
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
