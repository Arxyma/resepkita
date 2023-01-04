import 'package:flutter/material.dart';
import 'package:resepkita/views/widgets/detail_card.dart';
import 'package:resepkita/models/recipe.dart';
import 'package:resepkita/models/recipe.api.dart';

class Details extends StatefulWidget {
  final Recipe recipe;

  const Details({Key key, @required this.recipe}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Text(
              '${widget.recipe.name}',
              style:
                  TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return DetailCard(
                    id: '${widget.recipe.id}',
                    title: '${widget.recipe.name}',
                    category: '${widget.recipe.category}',
                    area: '${widget.recipe.area}',
                    instruction: '${widget.recipe.instruction}',
                    tags: '${widget.recipe.tags}',
                    thumbnailUrl: '${widget.recipe.images}');
              },
            ),

      // body: _isLoading
      //     ? Center(child: CircularProgressIndicator())
      //     : return DetailCard(title: ${widget.recipe.name}, category: category, area: area, thumbnailUrl: thumbnailUrl, id: id, instruction: instruction, tags: tags),
    );
  }
}
