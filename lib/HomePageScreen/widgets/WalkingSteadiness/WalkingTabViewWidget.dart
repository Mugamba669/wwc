import 'package:flutter/material.dart';
import '/HomePageScreen/widgets/WalkingSteadiness/WalkingAdvisoryWidgetPage.dart';

import 'WalkingMeasureWidgetPage.dart';






class WalkingTabViewWidget extends StatefulWidget {
  const WalkingTabViewWidget({super.key});

  @override
  State<WalkingTabViewWidget> createState() =>
      _WalkingTabViewWidgetState();
}

class _WalkingTabViewWidgetState
    extends State<WalkingTabViewWidget>
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
              DefaultTabController(
                length: 2,
                child: Container(
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
                      WalkingMeasureWidgetPage(),
                      WalkingAdvisoryWidgetPage()
                    ],
                  ),
                ),
                
          
        ],
         ),
      );
  }}