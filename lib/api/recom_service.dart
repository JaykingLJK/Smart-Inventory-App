import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp/model/recipe_model.dart';
import '../model/listing_model.dart';
import 'package:http/http.dart' as http;
import '../model/recipe_model.dart';

class RecomService {
  final String urlRecommendation = "http://54.151.224.79:5000/recom";

  Future<List<Recipe>> getRecom() async{
    http.Response res =  await http.get(Uri.parse(urlRecommendation), headers: {"Access-Control-Allow-Origin": "*"});
    if (res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      List<Recipe> recipes = body.map((dynamic item) => Recipe.fromJson(item)).toList();

      return recipes;
    }
    else{
      throw "Can't get recommendation list.";
    }
  }


}