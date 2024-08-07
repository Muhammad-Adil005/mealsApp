import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  const CategoryMealScreen(
      {super.key, required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    // Filter meals by the selected categoryId
    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final meal = filteredMeals[index];
          return MealItem(
            title: meal.title,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
          );
        },
      ),
    );
  }
}
