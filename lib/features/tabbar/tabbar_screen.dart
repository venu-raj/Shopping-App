import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_demo/core/theme/pallete.dart';
import 'package:shopping_app_demo/features/cart/screens/cart_screen.dart';
import 'package:shopping_app_demo/features/home/screens/home_screen.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabWidgets[_currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house_rounded,
              color: _currentIndex == 0 ? Colors.black : Pallete.greyColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/appbar_icon2.png",
              color: _currentIndex == 1 ? Colors.black : Pallete.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}

const tabWidgets = [
  HomeScreen(),
  CartScreen(),
];
