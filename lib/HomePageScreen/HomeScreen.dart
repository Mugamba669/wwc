import 'package:flutter/material.dart';
import '/HomePageScreen/ReportScreen.dart';
import 'DefaultHomePage.dart';
import 'SettingsPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int _selectedIndex = 0;
  List Page = [
    const DefaultHomePage(),
    const ReportScreen(),
    const SettingsPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // drawer: AppDrawerScreen(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: const Text(''),
        title: const Text(
          "WWC",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: ((value) => onItemTapped(value)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // type: BottomNavigationBarType.fixed,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 16, 98, 165),
        unselectedItemColor: const Color.fromARGB(118, 182, 182, 182),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range_sharp, size: 30), label: 'Report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30), label: 'Settings'),
        ],
      ),
    );
  }
}
