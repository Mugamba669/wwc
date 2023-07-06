import 'package:flutter/material.dart';

import '../../HomeScreen.dart';
import 'TemperatureDIsplayScreenTabViewWidget.dart';
 

class TemperatureDisplayScreen extends StatefulWidget {
  const TemperatureDisplayScreen({super.key});

  @override
  State<TemperatureDisplayScreen> createState() => _TemperatureDisplayScreenState();
}

class _TemperatureDisplayScreenState extends State<TemperatureDisplayScreen> {
  @override
      int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.thermostat),
        title: const Text("Temperature"),
      ),
      body: const SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child:  TemperatureDisplayScreenTabViewWidget()
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