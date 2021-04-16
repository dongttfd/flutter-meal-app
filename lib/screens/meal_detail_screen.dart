import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> routeArguments =
        ModalRoute.of(context).settings.arguments;

    final Meal meal = routeArguments['meal'];

    return Scaffold(
      appBar: AppBar(
        title: Text('meal detail'),
      ),
      body: Text('bcsok'),
    );
  }
}
