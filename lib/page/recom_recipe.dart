import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/recipe_service.dart';
import 'package:myapp/model/recipe_model.dart';
import 'package:myapp/api/recom_service.dart';
import 'package:myapp/page/recipe_detail.dart';

class RecomRecipePage extends StatefulWidget {
  @override
  _RecomRecipePage createState() => _RecomRecipePage();

}

class _RecomRecipePage extends State<RecomRecipePage>{

  final RecipeService httpService = RecipeService();
  final RecomService recomService = RecomService();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommendation Recipe"),
      ),
      body: FutureBuilder(
        future: recomService.getRecom(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot){
          if(snapshot.hasData){
            List<Recipe>? recipes = snapshot.data;
            return ListView(
              children: recipes!
                  .map(
                      (Recipe recipe) => ListTile(
                    title: Text(recipe.name),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RecipeDetail(
                              recipe: recipe,
                            )
                        )
                    ).then(onGoBack),
                  )
              ).toList(),
            );
          }
          // return const Center(child: CircularProgressIndicator(),);
          return Text('${snapshot.error}');
        },
      ),
    );
  }


  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

}
