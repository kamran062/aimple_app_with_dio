import 'package:flutter/material.dart';
import 'package:myimpactmetertask/view/screens/profile_screen.dart';
import 'package:myimpactmetertask/view/screens/setting_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/main_screen_provider.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: homeProvider.currentIndex,
        children:  <Widget>[
          HomeScreen(),
          ProfileScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeProvider.currentIndex,
        onTap: (index) {
          homeProvider.changeTab(index); // Update the current tab index
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}





