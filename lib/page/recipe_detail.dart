import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/api/recipe_service.dart';
import 'package:myapp/model/recipe_model.dart';
import 'package:myapp/page/listings.dart';
import 'package:overlay_support/overlay_support.dart';

import '../model/listing_model.dart';

class RecipeDetail extends StatelessWidget{
  final Recipe recipe;
  final RecipeService recipeService = RecipeService();
  RecipeDetail({Key? key,
    required this.recipe
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
              12.0
          ),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text("Ingredient 1"),
                  subtitle: Text(recipe.ingredient_1),
                ),
                ListTile(
                  title: const Text("Ingredient 2"),
                  subtitle: Text(recipe.ingredient_2),
                ),
                ListTile(
                  title: const Text("Ingredient 3"),
                  subtitle: Text(recipe.ingredient_3),
                ),
                ListTile(
                  title: const Text("Ingredient 4"),
                  subtitle: Text(recipe.ingredient_4),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}