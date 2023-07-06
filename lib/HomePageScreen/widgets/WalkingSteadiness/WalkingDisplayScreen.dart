import 'package:flutter/material.dart';

import '../../HomeScreen.dart';
import 'WalkingTabViewWidget.dart';
 

class WalkingDisplayScreen extends StatefulWidget {
  const WalkingDisplayScreen({super.key});

  @override
  State<WalkingDisplayScreen> createState() => _WalkingDisplayScreenState();
}

class _WalkingDisplayScreenState extends State<WalkingDisplayScreen> {

  void onItemTapped(int index) {
    setState(() {
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Walking Steadiness"),
      ),
      body: const SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child: Column(
          children: [
            WalkingTabViewWidget(),
          ],
        ),
      ),
      //    bottomNavigationBar: BottomNavigationBar(
        
      //   currentIndex: _selectedIndex,
      //   onTap: ((value) => onItemTapped(value)),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   // type: BottomNavigationBarType.fixed,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: const Color.fromARGB(255, 16, 98, 165),
      //   unselectedItemColor: const Color.fromARGB(118, 182, 182, 182),
      //   showUnselectedLabels: true,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: InkWell(
      //       onTap: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context){
      //           return const HomeScreen();
      //         }));
      //       },
      //       child: const Icon(Icons.home, size: 20,)), label: 'Home'),
      //     const BottomNavigationBarItem(icon: Icon(Icons.date_range_sharp,size: 30), label: 'Report'),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.settings,size: 20), label: 'Settings'),
      //   ],
      // ),
    );
  }
}