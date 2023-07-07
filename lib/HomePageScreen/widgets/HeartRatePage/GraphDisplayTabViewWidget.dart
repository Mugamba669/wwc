import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wwc/Graphs/HRate.dart';

class GraphDisplayTabViewWidget extends StatefulWidget {
  final BluetoothDevice device;
  const GraphDisplayTabViewWidget({super.key, required this.device});

  @override
  State<GraphDisplayTabViewWidget> createState() =>
      _GraphDisplayTabViewWidgetState();
}

class _GraphDisplayTabViewWidgetState extends State<GraphDisplayTabViewWidget>
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
                const EdgeInsets.only(left: 10, bottom: 0, right: 20, top: 0),
            height: size.width ,
            decoration: const BoxDecoration(
                // color: Color.fromARGB(171, 214, 211, 211),
                ),
            child: TabBarView(
              controller: tab2Controller,
              children: [
                HRate(device: widget.device),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
