


import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:spacesly_app/environment_variable.dart';
import 'package:spacesly_app/model/entity_model.dart';

class EntityApis{
  List<Entity> data = [];
  EntityApis(var res){
    this.data = res;
  }
  static  getTopWedding()async{
    print("ok");

    var res;
    res = await Dio().get(Environment.topPartyApi);
    print("ok1");
    print(res);
    return res;
  }
}