import 'package:flutter/material.dart';
import 'meal_list_page.dart';


class MealDetailPage extends StatelessWidget {
  final int mealId;

  const MealDetailPage(this.mealId, {super.key});

  @override
  Widget build(BuildContext context) {
    // final pony = ponies[ponyId];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Detail Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),
                  color: Colors.pinkAccent,
                ),
                child: Text(
                    "some",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                )
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                    "some",
                    style: Theme.of(context).textTheme.bodyLarge
                )
            )
          ],
        ),
      )
    );
  }
}