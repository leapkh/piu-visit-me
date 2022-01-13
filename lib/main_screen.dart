import 'package:flutter/material.dart';
import 'package:visit_me/screen/main/account_screen.dart';
import 'package:visit_me/screen/main/home_screen.dart';
import 'package:visit_me/screen/main/more_screen.dart';
import 'package:visit_me/screen/main/provinces_screen.dart';
import 'package:visit_me/screen/main/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get body {
    if (navBarIndex == 0) {
      return const HomeScreen();
    } else if (navBarIndex == 1) {
      return const ProvincesScreen();
    } else if (navBarIndex == 2) {
      return const SearchScreen();
    } else if (navBarIndex == 3) {
      return const AccountScreen();
    } else {
      return const MoreScreen();
    }
  }

  Widget get bottomNavigationBar {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Provinces'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Account'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: navBarIndex,
      onTap: onBottomNavbarClick,
    );
  }

  void onBottomNavbarClick(int index) {
    setState(() {
      navBarIndex = index;
    });
  }
}
