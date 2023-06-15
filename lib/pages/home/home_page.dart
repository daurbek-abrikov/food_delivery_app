import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/tab.dart';

import '../../controllers/home_controller.dart';

import 'bottom_navigation.dart';
import 'tab_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends StateMVC {
  final HomeController _homeController = HomeController.controller;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      // processing logic of back buttin may be different
      onWillPop: () async {
          if (_homeController.currentTab != TabItem.CATEGORIES) {
            if (_homeController.currentTab == TabItem.SEARCH) {
              _homeController.selectTab(TabItem.CART);
            } else {
              _homeController.selectTab(TabItem.CATEGORIES);
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
          currentTab: _homeController.currentTab,
          onSelectTab: _homeController.selectTab,
        ),
      ),);
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      // Offstage does this:
      // if it is not currently selected element in bottom nav bar, then it will hide it
      offstage: _homeController.currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _homeController.navigatorKeys[tabItem]!,   
        tabItem: tabItem,
      ),
    );
  }
}