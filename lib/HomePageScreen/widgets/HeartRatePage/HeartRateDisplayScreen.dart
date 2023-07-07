import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../HomeScreen.dart';
import 'HeartRateDisplayScreenTabViewWidget.dart';

class HeartRateDisplayScreen extends StatefulWidget {
  final BluetoothDevice device;
  const HeartRateDisplayScreen({super.key, required this.device});

  @override
  State<HeartRateDisplayScreen> createState() => _HeartRateDisplayScreenState();
}

class _HeartRateDisplayScreenState extends State<HeartRateDisplayScreen> {
  void onItemTapped(int index) {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.heart_broken),
        title: const Text("Heart Rate"),
      ),
      body: SingleChildScrollView(
        child: HeartRateDisplayScreenTabViewWidget(
          device: widget.device,
        ),
      ),
    );
  }
}
