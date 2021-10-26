import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Recipe {
  final int id;
  final String name;
  final String ingredient_1;
  final String ingredient_2;
  final String ingredient_3;
  final String ingredient_4;


  Recipe({
    required this.id,
    required this.name,
    required this.ingredient_1,
    required this.ingredient_2,
    required this.ingredient_3,
    required this.ingredient_4,
  });


  factory Recipe.fromJson(Map<String, dynamic> json) {

    return Recipe(
      id: json['id'] as int,
      name: json['name'] as String,
      ingredient_1: json['ingredient'][0] as String,
      ingredient_2: json['ingredient'][1] as String,
      ingredient_3: json['ingredient'][2] as String,
      ingredient_4: json['ingredient'][3] as String,
    );
  }

}