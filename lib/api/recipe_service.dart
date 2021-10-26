import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp/model/recipe_model.dart';
import '../model/listing_model.dart';
import 'package:http/http.dart' as http;
import '../model/listing_model.dart';

class RecipeService {
  final String urlListings = "http://54.151.224.79:5000/recipes";

  Future<List<Recipe>> getRecipe() async{
    http.Response res =  await http.get(Uri.parse(urlListings), headers: {"Access-Control-Allow-Origin": "*"});
    if (res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      List<Recipe> recipes = body.map((dynamic item) => Recipe.fromJson(item)).toList();

      return recipes;
    }
    else{
      throw "Can't get listings.";
    }
  }

  Future<String> deleteRecipe(Recipe recipe) async{
    var reqBody = jsonEncode({"id":recipe.id});
    http.Response res = await http.delete(Uri.parse(urlListings), body: reqBody);
    if (res.statusCode == 200){
      String notification = "${recipe.name} have been deleted.\n";
      return notification;
    }
    else{
      return "Error when deleting the listing";
    }
  }


}