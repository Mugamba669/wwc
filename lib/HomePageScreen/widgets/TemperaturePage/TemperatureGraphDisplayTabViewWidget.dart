import 'package:flutter/material.dart';

class TemperatureGraphDisplayTabViewWidget extends StatefulWidget {
  const TemperatureGraphDisplayTabViewWidget({super.key});

  @override
  State<TemperatureGraphDisplayTabViewWidget> createState() => _TemperatureGraphDisplayTabViewWidgetState();
}

class _TemperatureGraphDisplayTabViewWidgetState extends State<TemperatureGraphDisplayTabViewWidget> with TickerProviderStateMixin{
  @override
 Widget build(BuildContext context) {
      TabController tab2Controller = TabController(length: 2, vsync: this);
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
                      Tab(text: "Week"),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10, bottom: 25, right: 20, top: 10),
                  height: size.height*0.32,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(171, 214, 211, 211),
                      ),
                  child: TabBarView(
                    controller: tab2Controller,
                    children: const [
                      Center(child: Text("This will display temperature for the day graph")),
                       Center(child: Text("This will display temperature for the display week graph")),
                    ],
                  ),
                ),
                
          
        ],
         ),
      );
  }
}