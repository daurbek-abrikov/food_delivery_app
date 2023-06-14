import 'package:flutter/material.dart';
import '../../models/tab.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.CATEGORIES : MyTab(name: "Главная", color: Colors.blue, icon: Icons.home_outlined),
  TabItem.SEARCH : MyTab(name: "Поиск", color: Colors.blue, icon: Icons.search),
  TabItem.CART : MyTab(name: "Корзина", color: Colors.blue, icon: Icons.shopping_basket_outlined),
  TabItem.PROFILE : MyTab(name: "Аккаунт", color: Colors.blue, icon: Icons.account_box_outlined)
};

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({super.key, required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: _colorTabMatching(currentTab),
        selectedFontSize: 13,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab.index,
        items: [
          _buildItem(TabItem.CATEGORIES),
          _buildItem(TabItem.SEARCH),
          _buildItem(TabItem.CART),
          _buildItem(TabItem.PROFILE),
        ],
        onTap: (index) => onSelectTab(
            TabItem.values[index]
        )
    );
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
        icon: Icon(
          _iconTabMatching(item),
          color: _colorTabMatching(item),
        ),
        label: tabs[item]?.name,
    );
  }

  IconData? _iconTabMatching(TabItem item) => tabs[item]?.icon;

  MaterialColor? _colorTabMatching(TabItem item) {
    return currentTab == item ? tabs[item]?.color : Colors.grey;
  }

}
