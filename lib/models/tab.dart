import 'package:flutter/material.dart';

// будет хранить основную информацию 
// об элементах меню
class MyTab {
  final String name;
  final MaterialColor color;
  final IconData icon;

  const MyTab({required this.name, required this.color, required this.icon});
}

enum TabItem { CATEGORIES, SEARCH, CART, PROFILE }