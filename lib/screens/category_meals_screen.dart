import 'package:flutter/material.dart';

import 'package:meal/widgets/meal_item.dart';

import 'package:meal/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArguments =
        ModalRoute.of(context).settings.arguments;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(routeArguments['id']))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArguments['title']),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(categoryMeals[index]),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
