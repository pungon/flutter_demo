import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavoriteMeealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMeealsNotifier() : super([]);

  bool toggleMalFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      //state.remove(meal);
      return false;
    } else {
      state = [...state, meal];
      //state.add(meal);
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMeealsNotifier, List<Meal>>((ref) {
  return FavoriteMeealsNotifier();
});
