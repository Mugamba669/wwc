import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wwc/Graphs/Temperature.dart';

class TemperatureGraphDisplayTabViewWidget extends StatefulWidget {
  final BluetoothDevice device;
  const TemperatureGraphDisplayTabViewWidget({super.key, required this.device});

  @override
  State<TemperatureGraphDisplayTabViewWidget> createState() => _TemperatureGraphDisplayTabViewWidgetState();
}

class _TemperatureGraphDisplayTabViewWidgetState extends State<TemperatureGraphDisplayTabViewWidget> with TickerProviderStateMixin{
  @override
 Widget build(BuildContext context) {
      TabController tab2Controller = TabController(length: 1, vsync: this);
      final size =MediaQuery.of(context).size;
    return  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        children: [
                 SizedBox(
                  height: size.height*0.009,
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
                  height: size.width,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(171, 214, 211, 211),
                      ),
                  child: TabBarView(
                    controller: tab2Controller,
                    children:  [
                      Temperature(device: widget.device),
                    ],
                  ),
                ),
        ],
         ),
      );
  }
}