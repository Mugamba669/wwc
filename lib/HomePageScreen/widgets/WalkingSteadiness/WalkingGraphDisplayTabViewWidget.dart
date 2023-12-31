import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wwc/Graphs/StepCount.dart';

class WalkingGraphDisplayTabViewWidget extends StatefulWidget {
  final BluetoothDevice device;
  const WalkingGraphDisplayTabViewWidget({super.key,required this.device});

  @override
  State<WalkingGraphDisplayTabViewWidget> createState() =>
      _WalkingGraphDisplayTabViewWidgetState();
}

class _WalkingGraphDisplayTabViewWidgetState
    extends State<WalkingGraphDisplayTabViewWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tab2Controller = TabController(length: 1, vsync: this);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.009,
          ),
          Container(
            color: const Color.fromARGB(255, 105, 205, 255),
            child: TabBar(
              controller: tab2Controller,
              labelColor: Colors.black54,
              unselectedLabelColor: Colors.black26,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: "Day"),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, bottom: 25, right: 20, top: 10),
            height: size.height * 0.32,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                // color: Color.fromARGB(171, 214, 211, 211),
                ),
            child: TabBarView(
              controller: tab2Controller,
              children:  [
                StepCount(device: widget.device),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
