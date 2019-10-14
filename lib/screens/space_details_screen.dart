import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacesly_app/single_entity_json/response.dart';
import 'package:spacesly_app/widgets/book_space_field_widget.dart';
import 'package:spacesly_app/widgets/header_secion_widget.dart';
import 'package:intl/intl.dart';
import '../environment_variable.dart';
class SpaceDetailsScreen extends StatefulWidget {
  final String EntityName;
  final int entity_id;
  SpaceDetailsScreen({this.EntityName, this.entity_id});
  @override
  _SpaceDetailsScreenState createState() => _SpaceDetailsScreenState();
}

class _SpaceDetailsScreenState extends State<SpaceDetailsScreen> {
  ScrollController scrollController = ScrollController();
  bool flag = false;
  bool flag1 = false;
  bool flag2 = false;
  TextEditingController _controllerName;
  TextEditingController _controllerPhone;
  TextEditingController _controllerEmail;
  TextEditingController _controllerNoOfGeusts;
  @override
  void initState() {
    super.initState();
    print("id");
    print(widget.entity_id);
    _getSingleEntityData();
    _getAddonDetails();
    _controllerName = TextEditingController();
    _controllerPhone = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerNoOfGeusts = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height * .3:MediaQuery.of(context).size.height * .8,
                  child: _response == null || _response.singleEntity == null ? Container(
                    child: Center(
                      child: Text("Loading...", style: TextStyle(color: Environment.textColor, fontSize: 18),),
                    ),
                  ) : HeaderSection(imageList: _response.singleEntity.images),
                ),
                Positioned(
                  left: 10,
                  top: 25,
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
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
                  _response==null || _response.singleEntity==null || _response.singleEntity.name==null ? Text('Loading...') :  Text( _response.singleEntity.name ??  "", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold),),
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
                        height: 30,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 126, 34, 1.0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: RawMaterialButton(
                          onPressed: (){
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
//                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                            child: Center(child: Text("Book now", style: TextStyle(color: Colors.white),))),
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
                  LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      print("max");
                      int maxlines = getWordCount(_response==null || _response.singleEntity==null || _response.singleEntity.description==null ? "" : _response.singleEntity.description);
                      print(maxlines);
                      return _response==null || _response.singleEntity==null || _response.singleEntity.description==null ? Text('Loading...') :Container(
                        width: MediaQuery.of(context).size.width,
                       child:
                             Column(
                               children: <Widget>[
                                 Text(_response.singleEntity.description ?? "", maxLines: !flag ? 3 : 20, overflow: TextOverflow.ellipsis,style: TextStyle(color: Environment.textColor, fontSize: 15),),
                                 maxlines > 20 ? Align(
                                   alignment: Alignment.bottomRight,
                                   child: InkWell(
                                       onTap: (){
                                         setState(() {
                                           flag = !flag;
                                         });
                                       },
                                       child: Text( flag ? "View less" : 'View more',
                                         style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),)),
                                 ) : Container(),
                               ],
                             ),
                      );
                    }
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    color: Environment.textColor,
                    height: 2,
                  ),
                 list.isEmpty ? Container(child: Text("Loading..."),) :
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Amenities", style: TextStyle(fontSize: 18,color: Environment.textColor, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                            Wrap(
                              children: List.generate(flag1 && list.length > 4 ? list.length : !flag1 && list.length < 4 ? list.length : 4, ((index){
                                return Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runAlignment: WrapAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(width: 10,),
//                                    Icon(Icons.star, color: !flag1 && list.length > 4 && index == 4-1 ?Colors.grey.withOpacity(0.3) : Colors.grey,),
                                    SizedBox(width: 1,),
                                    Container(
                          margin: EdgeInsets.symmetric(horizontal: 2,vertical: 4),
                          child: Text(
                              list[index].name + ",",
                              textAlign: TextAlign.center,style: TextStyle(color:!flag1 && list.length > 4 && index == 4-1 ?Environment.textColor.withOpacity(0.5) :Environment.textColor,fontWeight: FontWeight.bold))),
//                      SizedBox(width: MediaQuery.of(context).size.width*.,),
                                  ],
                                );
                              })),
                            ),
                            list.isNotEmpty && list.length > 4 ? Align(
                              widthFactor: 5.0,
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    flag1 = !flag1;
                                  });
                                },
                                child: Text(flag1 ? "View less" :"View More", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                              ),
                            ) : Container(),
                          ],
                        ),
                      ),
                  list1.isEmpty ? Container(child: Text("Loading..."),) :
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Activities", style: TextStyle(fontSize: 18,color: Environment.textColor, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10,),
                        Wrap(
                          children: List.generate(flag2 && list1.length > 4 ? list1.length : !flag2 && list1.length < 4 ? list1.length : 4, ((index){
                            return Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runAlignment: WrapAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(width: 10,),
//                                Icon(Icons.star, color: !flag2 && list1.length > 4 && index == 4-1 ?Colors.grey.withOpacity(0.3) : Colors.grey,),
                                SizedBox(width: 1,),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2,vertical: 4),
                                    child: Text(
                                        list1[index].name +",",
                                        textAlign: TextAlign.center,style: TextStyle(color:!flag2 && list1.length > 4 && index == 4-1 ?Environment.textColor.withOpacity(0.5) :Environment.textColor,fontWeight: FontWeight.bold))),
//                      SizedBox(width: MediaQuery.of(context).size.width*.,),
                              ],
                            );
                          })),
                        ),
                        list1.isNotEmpty && list1.length > 4 ? Align(
                          widthFactor: 5.0,
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                flag2 = !flag2;
                              });
                            },
                            child: Text(flag2 ? "View less" :"View More", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          ),
                        ) : Container(),
                      ],
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
                    children: List.generate(productsList.length, ((index){

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
                            Text(productsList[index].name ?? "", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold)),
                            SizedBox(height:5,),
                            Wrap(
                              children: List.generate(productsList[index].Pricing.length, ((inde){
                                return Text(productsList[index].Pricing[inde].rate.toString());
                              })),
                            ),
                            SizedBox(height:8,),
                            Text(productsList[index].description ?? ""),
                          ],
                        ),
                      );
                    })),
                  ),
                  Column(
                    children: List.generate(productsList1.length, ((index){

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
                            Text(productsList1[index].name ?? "", style: TextStyle(color: Environment.textColor, fontWeight: FontWeight.bold)),
                            SizedBox(height:5,),
                            Wrap(
                              children: List.generate(productsList1[index].Pricing.length, ((inde){
                                return Text(productsList1[index].Pricing[inde].rate.toString());
                              })),
                            ),
                            SizedBox(height:8,),
                            Text(productsList1[index].description ?? ""),
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
                        BookingSpaceField(
                          controller: _controllerName,
                          labelText: 'Name',
                          hintText: 'yourName',
                        ),
                        BookingSpaceField(
                          controller: _controllerPhone,
                          labelText: 'Phone',
                          hintText: '0000 0000000',
                          inputType: TextInputType.number,
                        ),
                        BookingSpaceField(
                          controller: _controllerEmail,
                          labelText: 'Email',
                          hintText: 'example@mail.com',
                          inputType: TextInputType.emailAddress,
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
                        BookingSpaceField(
                          controller: _controllerNoOfGeusts,
                          labelText: 'No of Guests',
                          hintText: '000',
                          inputType: TextInputType.number,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          height: 50,
                          decoration: BoxDecoration(
                            color: submit ? Colors.grey : Color.fromRGBO(230, 126, 34, 1.0),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: RawMaterialButton(
                              onPressed: submit ? null  : () {
                                if(_controllerName.text == null
                                || _controllerEmail.text == null
                                || _controllerPhone.text == null
                                ||_controllerNoOfGeusts.text == null
                                || from.toString().isEmpty){
                                  Flushbar(
                                    message: "Please Completing the form",
                                    duration: Duration(seconds: 2),
                                  )..show(context);
                                }else{
                                  _reserveEvent();
                                }
                              },
//                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                              child: Center(child: Text("Submit", style: TextStyle(color: Colors.white),))),
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


  List<ModelData> list= [];
  List<ModelData> list1= [];
  BaseResponse _response;
  _getSingleEntityData()async{
    try{
      var res = await Dio().get(Environment.baseUrlWithApi +"entities/${widget.EntityName}/");
      if(res.statusCode.toString() == "200"){
        setState(() {
          _response = BaseResponse.fromJson(res.data);
        });
        setState(() {
          list = _response.customField.amenitiesList;
          list1 = _response.customField.activitiesList;
        });
        print(list.length);
      }
    }catch(e){
      print("err");
      print(e.toString());
    }
  }

  int getWordCount(String text) {
    var workingText = text;
    workingText = workingText
      ..replaceAll('\n', ' ')
      ..replaceAll('.', ' ')
      ..replaceAll(',', ' ')
      ..replaceAll(':', ' ')
      ..replaceAll(';', ' ')
      ..replaceAll('?', ' ');
    var words = workingText.split(' ');
    words.removeWhere((word) => word.length == 0 || word == " ");
    return min(words.length, text.length);
  }


  List<Products> productsList = [];
  List<Products1> productsList1 = [];
  _getAddonDetails()async{
    try{
      var res = await Dio().get(Environment.apiProducts + "${widget.entity_id}",
      options: Options(
        headers: {
          "Content-Type" : "application/json",
          "Authorization" : "Token eec289046e39a2c707508c1c7aee9a327be2e1e5"
        }
      ),
      );
      print("produts");
      if(res.statusCode.toString() == "200"){
        setState(() {
          Iterable list = res.data;
          list.forEach((check){
            if(check.toString().contains("list_items_exist: false")){
              productsList.add(Products.fromJson(check));
            }else{
              productsList1.add(Products1.fromJson(check));
            }
          });
//          productsList = list.map((product) => Products.fromJson(product)).toList();
        });
      }
      print(res.data);
      print('${productsList.map((f) => f.name)}');
      print('${productsList1.map((f) => f.name)}');
    }catch(e){
      print("err1");
      print(e.toString());
    }
  }

  bool submit = false;
  _reserveEvent()async{
    setState(() {
      submit = true;
    });
    try{
      var res = await Dio().post("https://api.spacesly.com/api/requests/",data: {
        "phone" : _controllerPhone.text,
        "name" : _controllerName.text,
        "email" : _controllerEmail.text,
        "entity_id" : widget.entity_id,
        "status" : "S",
        "event_date" : from.toString(),
        "event_type" : "",
        "no_of_people" : _controllerNoOfGeusts.text,
      },
      options: Options(
        headers: {
          "Content-Type" : "application/json",
          "Authorization" : "Token eec289046e39a2c707508c1c7aee9a327be2e1e5"
        }
      ));
      print("event reserve res");
      if(res.statusCode.toString() == "200"){
        Flushbar(
          message: "Submited successfuly",
          duration: Duration(seconds: 2),
        )..show(context);
        setState(() {
          submit = false;
        });
      }
    }catch(e){
      Flushbar(
        message: "Smething wrong",
        duration: Duration(seconds: 2),
      )..show(context);
      print("err2");
      print(e.toString());
      setState(() {
        submit = false;
      });
    }
  }
}
