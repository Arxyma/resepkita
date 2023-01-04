class Recipe {
  final String id;
  final String name;
  final String images;
  final String category;
  final String area;
  final String instruction;
  final String tags;

  Recipe(
      {this.name,
      this.images,
      this.category,
      this.area,
      this.id,
      this.instruction,
      this.tags});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        id: json['idMeal'] as String,
        name: json['strMeal'] as String,
        images: json['strMealThumb'] as String,
        category: json['strCategory'] as String,
        instruction: json['strInstructions'] as String,
        tags: json['strTags'] as String,
        area: json['strArea'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {id: $id, name: $name, image: $images, category: $category, area: $area, tags: $tags, instruction: $instruction,}';
  }
}
