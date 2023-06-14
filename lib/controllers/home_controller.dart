import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/tab.dart';

class HomeController extends ControllerMVC {

  static HomeController _this = HomeController._();
  static HomeController get controller=> _this;

  factory HomeController() {
    if (_this == null) _this = HomeController._();
    return _this;
  }

  HomeController._();

  final _navigatorKeys = {
    TabItem.CATEGORIES: GlobalKey<NavigatorState>(),
    TabItem.SEARCH: GlobalKey<NavigatorState>(),
    TabItem.CART: GlobalKey<NavigatorState>(),
    TabItem.PROFILE: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, GlobalKey<NavigatorState>> get navigatorKeys => _navigatorKeys;

  var _currentTab = TabItem.CATEGORIES;

  TabItem get currentTab => _currentTab;

  void selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }
  
}