import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/widgets/meal_item.dart';


class FavouritesScreen extends StatelessWidget {
  final List<Meal> favourites;

  FavouritesScreen(this.favourites);

  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return Center(
        child: Text('You have no favourites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = favourites[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: favourites.length,
      );
    }
  }
}
