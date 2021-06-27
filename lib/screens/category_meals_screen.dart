import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final routeName = '/categories-meals';
  final String id;
  final String title;
  CategoryMealsScreen({this.id, this.title});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Meals'),
      ),
      body: Center(
        child: Text('Category Meals'),
      ),
    );
  }
}
