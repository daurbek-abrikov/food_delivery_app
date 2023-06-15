import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/meal_controller.dart';
import 'package:food_delivery_app/models/meal.dart';
import 'package:food_delivery_app/pages/meal/meal_list_item.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'meal_detail_page.dart';


class MealListPage extends StatefulWidget {
  const MealListPage({super.key});

  @override
  _MealListPageState createState() => _MealListPageState();
}

class _MealListPageState extends StateMVC {
  late MealController _controller;

  _MealListPageState() : super(MealController()) {
    _controller = controller as MealController;
  }
  
  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food List Page")),
      body: _buildContent()
    );
  }

  Widget _buildContent() {
    final state = _controller.currentState;
    if (state is MealResultLoading) {
      // загрузка
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is MealResultFailure) {
      return Center(
        child: Text(
          state.error,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red),
        ),
      );
    } else {
      final meals = (state as MealResultSuccess).mealList.meals;
      return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: meals.length, 
          itemBuilder: (context, index) {
            return MealListItem(meals[index]);
          }
        ),
      );
    }
  }

}
