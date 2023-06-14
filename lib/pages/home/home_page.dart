import 'package:flutter/material.dart';

import '../../models/tab.dart';
import 'bottom_navigation.dart';
import 'tab_navigator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  var _counter = 0;

  // GlobalKey will store uniqie key,
  // using which we can access widgets
  // that are already there
  final _navigatorKeys = {
    TabItem.CATEGORIES: GlobalKey<NavigatorState>(),
    TabItem.SEARCH: GlobalKey<NavigatorState>(),
    TabItem.CART: GlobalKey<NavigatorState>(),
    TabItem.PROFILE: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.CATEGORIES;

  // choosing ,enu element
  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      // processing logic of back buttin may be different
      onWillPop: () async {
          if (_currentTab != TabItem.CATEGORIES) {
            if (_currentTab == TabItem.SEARCH) {
              _selectTab(TabItem.CART);
            } else {
              _selectTab(TabItem.CATEGORIES);
            }
            return false;
          } else {
            return true;
          }

      },
      child: Scaffold(
        // Stack places one element on top of another, so we just switch between them
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.CATEGORIES),
          _buildOffstageNavigator(TabItem.SEARCH),
          _buildOffstageNavigator(TabItem.CART),
          _buildOffstageNavigator(TabItem.PROFILE),
        ]),
        bottomNavigationBar: MyBottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),);
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      // Offstage does this:
      // if it is not currently selected element in bottom nav bar, then it will hide it
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}