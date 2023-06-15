import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/category_list_page.dart';
import '../../../models/tab.dart';

import '../cart_page.dart';
import '../meal/meal_list_page.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,

      onGenerateRoute: (routeSettings) {
        // first we define current page
        Widget currentPage;
        if (tabItem == TabItem.CATEGORIES) {
          currentPage = const CategoryListPage();
        } else if (tabItem == TabItem.CART) {
          currentPage = const CartPage();
        } else {
          currentPage = const MealListPage();
        }
        // builind Route (page or screen)
        return MaterialPageRoute(builder: (context) => currentPage,);
      },
    );
  }

}