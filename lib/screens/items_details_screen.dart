import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spacesly_app/model/entity_model.dart';
import 'package:spacesly_app/screens/space_details_screen.dart';
import 'package:spacesly_app/widgets/items_details_widget.dart';

import '../environment_variable.dart';
import '../environment_variable.dart';


class ItemsScreenDetails extends StatefulWidget {
  final String appBarText;
  final List<Entity> weddingList;
  final List<Entity> partyList;
  final List<Entity> corporateList;
  ItemsScreenDetails({this.appBarText, this.weddingList, this.corporateList, this.partyList});
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
              Align(
                alignment: Alignment.center,
                child: Text(widget.weddingList != null ? "Wedding Spaces in Islamabad":widget.partyList != null ? "Party Spaces in Islamabad" : widget.corporateList != null ? "Corporate Spaces in Islamabad" : "",
                  style: TextStyle(
                      color: Environment.textColor,
                      fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
              ),
              Column(

                children: List.generate(widget.weddingList != null ? widget.weddingList.length
                    : widget.partyList != null ? widget.partyList.length : widget.corporateList != null ? widget.corporateList.length : 0, ((index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: RawMaterialButton(
                        onPressed: (){
                          Navigator.of(context).push(PageTransition(child: SpaceDetailsScreen(
                            EntityName: widget.weddingList != null ? widget.weddingList[index].permalink : widget.partyList != null ? widget.partyList[index].permalink : widget.corporateList != null ? widget.corporateList[index].permalink : null,
                            entity_id: widget.weddingList != null ? widget.weddingList[index].entity_id : widget.partyList != null ? widget.partyList[index].entity_id : widget.corporateList != null ? widget.corporateList[index].entity_id : null,
                          ), type: PageTransitionType.rightToLeft));
                        },
                        child: ItemsDeailsWidget(
                          name: widget.weddingList != null ? widget.weddingList[index].name : widget.partyList != null ? widget.partyList[index].name : widget.corporateList != null ? widget.corporateList[index].name : null,
                          image: widget.weddingList != null ? widget.weddingList[index].featured_image : widget.partyList != null ? widget.partyList[index].featured_image : widget.corporateList != null ? widget.corporateList[index].featured_image : null,
                        )),
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
