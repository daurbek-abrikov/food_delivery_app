import 'package:flutter/material.dart';
import 'food_list_page.dart';


class FoodDetailPage extends StatelessWidget {
  final int ponyId;

  const FoodDetailPage(this.ponyId);

  @override
  Widget build(BuildContext context) {
    final pony = ponies[ponyId];
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Detail Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),
                  color: Colors.pinkAccent,
                ),
                child: Text(
                    pony.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                )
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                    pony.desc,
                    style: Theme.of(context).textTheme.bodyLarge
                )
            )
          ],
        ),
      )
    );
  }
}