import 'package:flutter/material.dart';
import 'package:spacesly_app/widgets/book_space_field_widget.dart';
import 'package:spacesly_app/widgets/header_secion_widget.dart';
import 'package:intl/intl.dart';
import '../environment_variable.dart';
import '../environment_variable.dart';
import '../environment_variable.dart';
import '../environment_variable.dart';
import '../environment_variable.dart';
import '../environment_variable.dart';
import '../environment_variable.dart';

class SpaceDetailsScreen extends StatefulWidget {
  @override
  _SpaceDetailsScreenState createState() => _SpaceDetailsScreenState();
}

class _SpaceDetailsScreenState extends State<SpaceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  child: HeaderSection(),
                ),
                Positioned(
                  left: 10,
                  top: 25,
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Name of the Space", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      Row(
                        children:List.generate(5, ((index){
                          return Icon(Icons.star, color: Colors.grey);
                        })),
                      ),
                      SizedBox(width: 2,),
                      Text("100", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold, fontSize: 16),),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 126, 34, 1.0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(child: Text("Book now", style: TextStyle(color: Colors.white),)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.people, color: Colors.grey,),
                      SizedBox(width: 2,),
                      Text("100", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold, fontSize: 16),),

                    ],
                  ),
                  SizedBox(height: 30),
                  Text("About the space",style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10),
                  Text("Lorem ipsum dollar sit Lorem ipsum dollar sit"),
                  Text("Lorem ipsum dollar sit Lorem ipsum dollar sit"),
                  Text("Lorem ipsum dollar sit Lorem ipsum dollar sit"),
                  Text("Lorem ipsum dollar sit Lorem ipsum dollar sit"),
                  Text("Lorem ipsum dollar sit Lorem ipsum dollar sit"),
                  Text("Lorem ipsum dollar sit Lorem ipsum dollar sit"),
                  Text("Lorem ipsum dollar sit Lorem ipsum dollar sit"),
                  Row(
                    children: <Widget>[
                      Text("Lorem ipsum dollar sit"),
                      SizedBox(width: 8,),
                      InkWell(
                        child: Text("View More", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    color: Environment.textColor,
                    height: 2,
                  ),
              Text("Custom Field Group", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Wrap(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.grey,),
                      SizedBox(width: 5,),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                          child: Text("CustomField", textAlign: TextAlign.center,style: TextStyle(color:Environment.textColor,fontWeight: FontWeight.bold))),
                      SizedBox(width: MediaQuery.of(context).size.width/6,),
                      Icon(Icons.star, color: Colors.grey,),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                          child: Text("CustomField", textAlign: TextAlign.center,style: TextStyle(color:Environment.textColor, fontWeight: FontWeight.bold),)),
                      SizedBox(width: MediaQuery.of(context).size.width,),
                      SizedBox(height: 5,),
                      Icon(Icons.star, color: Colors.grey,),
                      SizedBox(width: 5,),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                          child: Text("CustomField", textAlign: TextAlign.center,style: TextStyle(color:Environment.textColor, fontWeight: FontWeight.bold))),
                      SizedBox(width: MediaQuery.of(context).size.width/6,),
                      Icon(Icons.star, color: Colors.grey.withOpacity(0.2),),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                          child: Text("CustomField", textAlign: TextAlign.center,style: TextStyle(color:Environment.textColor.withOpacity(0.3), fontWeight: FontWeight.bold))),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/1.5),
                    child: InkWell(
                     child: Text("View More", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    color: Environment.textColor,
                    height: 2,
                  ),
                  Text("Addons from the host", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30,),
                  Column(
                    children: List.generate(2, ((index){
                      return Container(
                        padding: EdgeInsets.only(top: 10, left: 5),
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Environment.textColor)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Addon title", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold)),
                            SizedBox(height:5,),
                            Text("Price Here"),
                            SizedBox(height:8,),
                            Text("Add on descryption here"),
                          ],
                        ),
                      );
                    })),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    margin: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Environment.textColor)
                    ),
                    child: Column(
                      children: <Widget>[
                        Text("Book this space", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20,),
                        BookingApcaeFoield(
                          labelText: 'Name',
                          hintText: 'yourName',
                        ),
                        BookingApcaeFoield(
                          labelText: 'Phone',
                          hintText: '0000 0000000',
                        ),
                        BookingApcaeFoield(
                          labelText: 'Email',
                          hintText: 'example@mail.com',
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.withOpacity(0.3),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Text(from == '' ? "00/00/0000" : from, style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold),),
                              Spacer(),
                              IconButton(
                                onPressed: _slectDate,
                                icon: Icon(Icons.date_range, color: Environment.textColor,),
                              ),
                            ],
                          ),
                        ),
                        BookingApcaeFoield(
                          labelText: 'No of Guests',
                          hintText: 'yourName',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  var from = '';
  _slectDate()async{
    DateTime selected =await showDatePicker(

      context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2050)
    );
    if(selected != null ){
      setState(() {
        from = DateFormat('dd/MM/yyyy').format(selected).toString();
      });
    }
  }
}
