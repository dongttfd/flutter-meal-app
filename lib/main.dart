import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/models/meal.dart';

import 'package:meal/screens/tabs_screen.dart';
import 'package:meal/screens/category_meals_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/screens/not_found_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;

      _availableMeals = DUMMY_MEALS
          .where(
            (meal) =>
                ((!_filters['glutenFree']) || meal.isGlutenFree) &&
                ((!_filters['lactoseFree']) || meal.isLactoseFree) &&
                ((!_filters['vegan']) || meal.isVegan) &&
                ((!_filters['vegetarian']) || meal.isVegetarian),
          )
          .toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existsMeal = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existsMeal >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existsMeal);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.orange,
        canvasColor: Color.fromRGBO(255, 255, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (_) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (RouteSettings setting) {
      //   print(setting.name);
      // },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
      },
    );
  }
}
