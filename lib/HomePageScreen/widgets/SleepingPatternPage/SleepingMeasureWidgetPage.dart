import 'package:flutter/material.dart';

import 'SleepingGraphDisplayTabViewWidget.dart';




class SleepingMeasureWidgetPage extends StatefulWidget {
  const SleepingMeasureWidgetPage({super.key});

  @override
  State<SleepingMeasureWidgetPage> createState() => _SleepingMeasureWidgetPageState();
}

class _SleepingMeasureWidgetPageState extends State<SleepingMeasureWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height*0.025,),
        Text("Sleeping pattern:--", style: TextStyle(fontSize: size.height*0.035),),
          SizedBox(height: size.height*0.036,),
        Container(
          height: size.height*0.06,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color.fromARGB(188, 238, 123, 161)
          ),
          child: Center(child: Text("Statistics", style: TextStyle(fontSize: size.height*0.027),)),
        ),
        const SleepingGraphDisplayTabViewWidget()
      ],
    );
  }
}