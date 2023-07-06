import 'package:flutter/material.dart';

import 'SleepingAdvisoryWidgetPage.dart';
import 'SleepingMeasureWidgetPage.dart';




class SleepingTabViewWidget extends StatefulWidget {
  const SleepingTabViewWidget({Key? key});

  @override
  State<SleepingTabViewWidget> createState() =>
      _SleepingTabViewWidgetState();
}

class _SleepingTabViewWidgetState
    extends State<SleepingTabViewWidget>
    with TickerProviderStateMixin {
 
 
  @override
  Widget build(BuildContext context) {
      TabController _tabController = TabController(length: 2, vsync: this);
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
                    controller: _tabController,
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
                    controller: _tabController,
                    children: const [
                      SleepingMeasureWidgetPage(),
                      SleepingAdvisoryWidgetPage()
                    ],
                  ),
                ),
                
          
        ],
         ),
      );
  }}