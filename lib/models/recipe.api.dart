import 'dart:convert';
import 'package:resepkita/models/recipe.dart';
import 'package:http/http.dart' as http;

// https://www.themealdb.com/api/json/v2/1/latest.php

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('www.themealdb.com', '/api/json/v2/1/latest.php');

    final response = await http.get(uri);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['meals']) {
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
