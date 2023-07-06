import 'package:flutter/material.dart';

import 'GraphDisplayTabViewWidget.dart';

 

class MeasureWidgetPage extends StatefulWidget {
  const MeasureWidgetPage({super.key});

  @override
  State<MeasureWidgetPage> createState() => _MeasureWidgetPageState();
}

class _MeasureWidgetPageState extends State<MeasureWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height*0.025,),
        Text("Heart: 91bpm", style: TextStyle(fontSize: size.height*0.035),),
          SizedBox(height: size.height*0.036,),
        Container(
          height: size.height*0.06,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color.fromARGB(188, 238, 123, 161)
          ),
          child: Center(child: Text("Statistics", style: TextStyle(fontSize: size.height*0.027),)),
        ),
        // GraphDisplayTabViewWidget(),
        const GraphDisplayTabViewWidget()
      ],
    );
  }
}