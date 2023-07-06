import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../HomeScreen.dart';
import 'WalkingTabViewWidget.dart';
 

class WalkingDisplayScreen extends StatefulWidget {
  final BluetoothDevice device;
  const WalkingDisplayScreen({super.key, required this.device});

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
      body:  WalkingTabViewWidget(device: widget.device,),
    );
  }
}