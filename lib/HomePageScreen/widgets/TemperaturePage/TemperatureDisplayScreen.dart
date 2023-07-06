import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../HomeScreen.dart';
import 'TemperatureDIsplayScreenTabViewWidget.dart';
 

class TemperatureDisplayScreen extends StatefulWidget {
  final BluetoothDevice device;
  const TemperatureDisplayScreen({super.key, required this.device});

  @override
  State<TemperatureDisplayScreen> createState() => _TemperatureDisplayScreenState();
}

class _TemperatureDisplayScreenState extends State<TemperatureDisplayScreen> {

  void onItemTapped(int index) {
    setState(() {
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.thermostat),
        title: const Text("Temperature"),
      ),
      body:  SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child:  TemperatureDisplayScreenTabViewWidget(device:widget.device)
      ),
    );
  }
}