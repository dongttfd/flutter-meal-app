import 'package:flutter/material.dart';
import 'package:meal/category_item.dart';
import 'package:meal/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (category) => CategoryItem(
              category.title,
              category.color,
            ),
          )
          .toList(),
    );
  }
}
