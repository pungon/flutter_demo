import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/screens/meal_detail.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, 
  this.title, 
  required this.meals,
  });

  final String? title;
  final List<Meal> meals;
 
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => 
        MealDetail(meal: meal,
        
        
        )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index], onSelectMeal: selectMeal);

          // Column(
          //         children: [
          //             Text(meals[index].title,
          //             style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //               color: Theme.of(context).colorScheme.onBackground,),)
          //             //Text(meals[index].categories.join(', ')),
          //         ],
          // );
        });

    if (meals.isEmpty) {
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Uh oh ... nothinf here!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ]),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
