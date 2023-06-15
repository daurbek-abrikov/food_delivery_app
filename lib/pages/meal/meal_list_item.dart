import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealListItem extends StatelessWidget {
  final Meal meal ;
  
  MealListItem(this.meal);
  
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.3)
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                color: Theme.of(context).primaryColor,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                meal.name,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                meal.desc,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        )
    );
  }
}