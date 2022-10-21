import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isNotEmpty) {
      return const Center(
        child: Text(
          'Nenhuma refeição foi marcada com favorita',
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
