import 'package:flutter/material.dart';
import 'package:resepkita/views/profile.dart';
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
  int selectedPageIndex = 0;

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
              style:
                  TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
      body: [
        Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                      id: _recipes[index].id,
                      title: _recipes[index].name,
                      category: _recipes[index].category,
                      area: _recipes[index].area,
                      thumbnailUrl: _recipes[index].images,
                      tags: _recipes[index].tags,
                      instruction: _recipes[index].instruction,
                    );
                  },
                ),
        ),
        Center(
          child: Profile(),
        ),
      ][selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.menu_book_rounded),
            icon: Icon(Icons.import_contacts_rounded),
            label: 'Latest',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_rounded),
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
