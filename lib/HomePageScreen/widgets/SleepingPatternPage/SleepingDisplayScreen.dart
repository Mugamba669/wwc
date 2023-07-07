import 'package:flutter/material.dart';

import 'SleepingTabViewWidget.dart';
 

class SleepingDisplayScreen extends StatefulWidget {
  const SleepingDisplayScreen({super.key});

  @override
  State<SleepingDisplayScreen> createState() => _SleepingDisplayScreenState();
}

class _SleepingDisplayScreenState extends State<SleepingDisplayScreen> {

  void onItemTapped(int index) {
    setState(() {
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.bed),
        title: const Text("Hours Slept"),
      ),
      body: const SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child: SleepingTabViewWidget()
      ),
    
    );
  }
}