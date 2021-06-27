import 'package:flutter/material.dart';

import 'package:deli_meals/widgets/meal_item.dart';

import 'package:deli_meals/models/meal.dart';

import 'package:deli_meals/dummy_meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routeName = '/categories-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: displayedMeals.length > 0
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: displayedMeals[index].id,
                    title: displayedMeals[index].title,
                    imageUrl: displayedMeals[index].imageUrl,
                    duration: displayedMeals[index].duration,
                    complexity: displayedMeals[index].complexity,
                    affordability: displayedMeals[index].affordability,
                  );
                },
                itemCount: displayedMeals.length,
              )
            : Center(
                child: Text(
                  'No data',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
      ),
    );
  }
}
