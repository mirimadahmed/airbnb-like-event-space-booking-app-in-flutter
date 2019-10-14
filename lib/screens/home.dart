import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacesly_app/model/entity_model.dart';
import 'package:spacesly_app/screens/items_details_screen.dart';
import 'package:spacesly_app/screens/space_details_screen.dart';
import 'package:spacesly_app/widgets/home_icon_card.dart';
import 'package:spacesly_app/widgets/listing.dart';
import 'package:page_transition/page_transition.dart';
import '../environment_variable.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> icons = ["assets/wedding.png", "assets/party.png", "assets/corporate.png", "assets/sports.png", "assets/production.png"];
  final List<String> names = ["Wedding", "Party", "Corporate", "Sports", "Production"];
  double homeiconRow1;
  double homeiconRow2;
  double heading;
  bool listingData = false;
  bool checkInternet = true;
  bool serverError = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        homeiconRow1 = 20;
        homeiconRow2 = 20;
        heading = 60;
      });
    });
    _getEntity();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Environment.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedPadding(
                  curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.only(top: heading ?? MediaQuery.of(context).size.height + 50),
                  child: Text("What do you want to host today?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Environment.textColor),)),
              AnimatedPadding(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 800),
                padding:  EdgeInsets.only(top: homeiconRow1 ?? MediaQuery.of(context).size.height+100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, ((index) {
                      print(index.toString());
                      return HomeIconCard(
                        onPressed: (){
                          if(index == 0){
                            Navigator.push(context, PageTransition(child: ItemsScreenDetails(weddingList: topWeddingData,), type: PageTransitionType.rightToLeft));
                          }else if(index == 1){
                            Navigator.push(context, PageTransition(child: ItemsScreenDetails(partyList: topParty,), type: PageTransitionType.rightToLeft));
                          }else {
                            Navigator.push(context, PageTransition(child: ItemsScreenDetails(corporateList: topCorporate,), type: PageTransitionType.rightToLeft));
                          }
                        },
                        icon: icons[index],
                        text: names[index],
                      );
                    }))),
              ),
              AnimatedPadding(
                curve: Curves.fastOutSlowIn,
                duration: Duration(microseconds: 1300),
                padding:  EdgeInsets.only(top:homeiconRow2 ?? MediaQuery.of(context).size.height+100),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, ((index) {
                        return Stack(
                          overflow: Overflow.visible,
                            children: [
                          HomeIconCard(
                            icon: icons[index + 3],
                              text: names[index + 3]
                          ),
                          Positioned(
                            right: -20,
                            top: -5,
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(230, 126, 34, 1.0),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(child: Text("Coming Soon", style: TextStyle(color: Colors.white),)),
                            ),
                          )
                        ]);
                      })))]
                ),
              ),

              !listingData ? Container(
                margin: EdgeInsets.only(top: 100),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Environment.textColor),
                ),
              )  :!checkInternet ? Container(
                margin: EdgeInsets.only(top: 150),
                child: Text("Check your internet", style: TextStyle(color: Environment.textColor, fontSize: 16),),
              ) : serverError ? Container(
                margin: EdgeInsets.only(top: 150),
                child: Text("There is a problem with server", style: TextStyle(color: Environment.textColor, fontSize: 16),),
              ) :
              Column(
                children: <Widget>[
                  topWeddingData.length == 0 ? Container() : Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Top Wedding spaces in Islamabad", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Environment.textColor),),
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, PageTransition(child: ItemsScreenDetails(
                                      weddingList: topWeddingData,
                                    ), type: PageTransitionType.rightToLeft));
                                  },
                                  child: Text("See All", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Environment.textColor)))
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
//                  shrinkWrap: true,
                            children: List.generate(topWeddingData.length, ((index) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(PageTransition(child: SpaceDetailsScreen(EntityName: topWeddingData[index].permalink, entity_id: topWeddingData[index].entity_id,), type: PageTransitionType.rightToLeft));
                                      },
                                      child: Listing(
                                        image: topWeddingData[index].featured_image,
                                        name: topWeddingData[index].name,
                                      )));
                            })),
                          ),
                        ),
                      ],
                    ),
                  ),
                  topParty.length == 0 ? Container() :Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Top Party spaces in Islamabad", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Environment.textColor),),
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, PageTransition(child: ItemsScreenDetails(
                                      partyList: topParty,
                                    ), type: PageTransitionType.rightToLeft));
                                  },
                                  child: Text("See All", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Environment.textColor)))
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
//                  shrinkWrap: true,
                            children: List.generate(topParty.length, ((index) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(PageTransition(child: SpaceDetailsScreen(EntityName: topParty[index].permalink, entity_id: topParty[index].entity_id,), type: PageTransitionType.rightToLeft));
                                      },
                                      child: Listing(
                                        image: topParty[index].featured_image,
                                        name: topParty[index].name,
                                      )));
                            })),
                          ),
                        ),
                      ],
                    ),
                  ),
                 topCorporate.length == 0 ? Container() : Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Top Corporate spaces in Islamabad", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Environment.textColor),),
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, PageTransition(child: ItemsScreenDetails(
                                      corporateList: topCorporate,
                                    ), type: PageTransitionType.rightToLeft));
                                  },
                                  child: Text("See All", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Environment.textColor)))
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
//                  shrinkWrap: true,
                            children: List.generate(topCorporate.length, ((index) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(PageTransition(child: SpaceDetailsScreen(EntityName: topCorporate[index].permalink, entity_id: topCorporate[index].entity_id,), type: PageTransitionType.rightToLeft));
                                      },
                                      child: Listing(
                                        image: topCorporate[index].featured_image,
                                        name: topCorporate[index].name,
                                      )));
                            })),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ));
  }



  List<Entity> topWeddingData = [];
  List<Entity> topParty = [];
  List<Entity> topCorporate = [];
  _getEntity()async{
    try{
      final result = await InternetAddress.lookup("google.com");
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        try{
          var res = await Dio().get(Environment.topWeddingApi);
          var res1 = await Dio().get(Environment.topPartyApi);
          var res2 = await Dio().get(Environment.topCorporateApi);
          if(res.statusCode.toString() == "200"){
            setState(() {
              Iterable list = res.data;
              topWeddingData = list.map((entity) => Entity.fromJson(entity["Entity"])).toList();
            });
            print(topWeddingData.length);
          }
          if(res1.statusCode.toString() == "200"){
            setState(() {
              Iterable list = res1.data;
              topParty = list.map((entity) => Entity.fromJson(entity["Entity"])).toList();
            });
            print(topParty.length);
          }
          if(res2.statusCode.toString() == "200"){
            setState(() {
              Iterable list = res2.data;
              topCorporate = list.map((entity) => Entity.fromJson(entity["Entity"])).toList();
            });
            print(topCorporate.length);
          }
          setState(() {
            listingData = true;
          });
        }catch(e){
          setState(() {
            serverError = true;
            listingData = true;
            checkInternet = false;
          });
          print(e.toString());
        }
      }
    }on SocketException catch (_){
      setState(() {
        checkInternet = false;
        listingData = true;
      });
    }
  }
}
