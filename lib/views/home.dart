import 'package:flutter/material.dart';
import 'package:resepkita/views/widgets/recipe_card.dart';
import 'package:resepkita/models/recipe.dart';
import 'package:resepkita/models/recipe.api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text(
                'Resep Kita',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      id: _recipes[index].id,
                      title: _recipes[index].name,
                      category: _recipes[index].category,
                      area: _recipes[index].area,
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
