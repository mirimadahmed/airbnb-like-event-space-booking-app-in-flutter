import 'package:flutter/material.dart';
import 'package:spacesly_app/screens/items_details_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Environment.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text("What do you want to host today?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Environment.textColor),)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, ((index) {
                      print(index.toString());
                      return HomeIconCard(
                        onPressed: (){
                          if(index == 0){
                            Navigator.push(context, PageTransition(child: ItemsScreenDetails(), type: PageTransitionType.rightToLeft));
                          }else if(index == 1){
                            Navigator.push(context, PageTransition(child: ItemsScreenDetails(), type: PageTransitionType.rightToLeft));
                          }else {
                            Navigator.push(context, PageTransition(child: ItemsScreenDetails(), type: PageTransitionType.rightToLeft));
                          }
                        },
                        icon: icons[index],
                        text: names[index],
                      );
                    }))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Top spaces in Islamabad", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Environment.textColor),),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, PageTransition(child: ItemsScreenDetails(), type: PageTransitionType.rightToLeft));
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
                  children: List.generate(10, ((index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Listing());
                  })),
                ),
              ),
            ],
          ),
        ));
  }
}
