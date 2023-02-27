import 'package:flutter/material.dart';

import '../screens/achievements_page.dart';
import '../screens/banner_page.dart';
import '../screens/collection_page.dart';
import '../screens/main_game.dart';
import '../screens/shop_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  final List<Widget> _children = [
    const ShopPage(),
    const BannerPage(),
    const MainGame(),
    const CollectionPage(),
    const AchievementsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_play), label: 'Recruit'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.beenhere_outlined), label: 'Collection'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Achievements')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );

    // Disables Back Button (implement in the future)
    /*return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.red, title: const Text('Screen 2'),
                automaticallyImplyLeading: true),
            body: const Center(
              child: Text('Welcome!'),
            )),
        onWillPop: () async {
          return false;
        });
  }*/
  }
}
