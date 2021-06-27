import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detail Screen - $id'),
      ),
      body: Center(
        child: Text('Meal Detail Screen - $id'),
      ),
    );
  }
}