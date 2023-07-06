import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'TemperatureAdvisoryWidgetPage.dart';
import 'TemperatureMeasureWidgetPage.dart';


class TemperatureDisplayScreenTabViewWidget extends StatefulWidget {
  final BluetoothDevice device;
  const TemperatureDisplayScreenTabViewWidget({Key? key, required this.device});

  @override
  State<TemperatureDisplayScreenTabViewWidget> createState() =>
      _TemperatureDisplayScreenTabViewWidgetState();
}

class _TemperatureDisplayScreenTabViewWidgetState
    extends State<TemperatureDisplayScreenTabViewWidget>
    with TickerProviderStateMixin {
 
 
  @override
  Widget build(BuildContext context) {
      TabController tabController = TabController(length: 2, vsync: this);
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
                    controller: tabController,
                    labelColor: Colors.black54,
                    unselectedLabelColor: Colors.black26,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: "Measure"),
                      Tab(text: "Advisory"),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 10),
                  height: size.height*0.65,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(171, 214, 211, 211),
                      ),
                  child: TabBarView(
                    controller: tabController,
                    children:  [
                      TemperatureMeasureWidgetPage(device:widget.device),
                      const TemperatureAdvisoryWidgetPage()
                    ],
                  ),
                ),
                
          
        ],
         ),
      );
  }}