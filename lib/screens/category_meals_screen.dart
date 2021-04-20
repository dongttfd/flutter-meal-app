import 'package:flutter/material.dart';

import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> avaiableMeals;

  CategoryMealsScreen(this.avaiableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, String> routeArguments;
  List<Meal> displayedMeals;
  bool initedData = false;

  @override
  void didChangeDependencies() {
    if (!initedData) {
      routeArguments = ModalRoute.of(context).settings.arguments;
      displayedMeals = widget.avaiableMeals
          .where((meal) => meal.categories.contains(routeArguments['id']))
          .toList();

      initedData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArguments['title']),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          displayedMeals[index],
          _removeMeal,
        ),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
