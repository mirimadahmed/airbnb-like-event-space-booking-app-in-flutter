import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spacesly_app/screens/space_details_screen.dart';
import 'package:spacesly_app/widgets/items_details_widget.dart';

import '../environment_variable.dart';
import '../environment_variable.dart';


class ItemsScreenDetails extends StatefulWidget {
  final String appBarText;
  ItemsScreenDetails({this.appBarText});
  @override
  _ItemsScreenDetailsState createState() => _ItemsScreenDetailsState();
}

class _ItemsScreenDetailsState extends State<ItemsScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Environment.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(widget.appBarText ?? "Wedding Spaces in Islamabad",
                style: TextStyle(
                    color: Environment.textColor,
                    fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              Column(
                children: List.generate(10, ((index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: RawMaterialButton(
                        onPressed: (){
                          Navigator.of(context).push(PageTransition(child: SpaceDetailsScreen(), type: PageTransitionType.rightToLeft));
                        },
                        child: ItemsDeailsWidget()),
                  );
                }))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
