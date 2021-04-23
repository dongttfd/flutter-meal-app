import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('You have no favorites yet - st art adding some !'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => MealItem(
              favoriteMeals[index],
            ),
            itemCount: favoriteMeals.length,
          );
  }
}
