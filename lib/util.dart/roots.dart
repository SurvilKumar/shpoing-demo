import 'package:fabcurate/screens/category.dart';
import 'package:fabcurate/screens/curate.dart';
import 'package:fabcurate/screens/homepage.dart';
import 'package:fabcurate/screens/more_option.dart';
import 'package:fabcurate/screens/sale.dart';

import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? child;
    switch (_selectedIndex) {
      case 0:
        child = const Home();
        break;
      case 1:
        child = const CATEGORY();
        break;
      case 2:
        child = const CURATE();
        break;
      case 3:
        child = const Sale();
        break;
      case 4:
        child = const More();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset("assets/images/nameplate.png", fit: BoxFit.cover),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 40,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.grey,
            size: 40,
          )
        ],
      ),
      bottomNavigationBar: menu(),
      body: child,
    );
  }

  Widget menu() {
    return BottomNavigationBar(
      backgroundColor: Colors.blueAccent,
      selectedItemColor: Colors.amber[200],
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          label: "HOME",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "CATEGORY",
          icon: Icon(Icons.category),
        ),
        BottomNavigationBarItem(
          label: "CURATE",
          icon: Icon(Icons.account_balance_wallet),
        ),
        BottomNavigationBarItem(
          label: "Sale",
          icon: Icon(Icons.flash_on),
        ),
        BottomNavigationBarItem(label: "More", icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}
