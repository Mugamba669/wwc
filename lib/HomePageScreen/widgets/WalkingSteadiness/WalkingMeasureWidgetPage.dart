import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'WalkingGraphDisplayTabViewWidget.dart';

class WalkingMeasureWidgetPage extends StatefulWidget {
  final BluetoothDevice device;
  const WalkingMeasureWidgetPage({super.key, required this.device});

  @override
  State<WalkingMeasureWidgetPage> createState() => _WalkingMeasureWidgetPageState();
}

class _WalkingMeasureWidgetPageState extends State<WalkingMeasureWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height*0.025,),
        Text("Walking steadiness:--", style: TextStyle(fontSize: size.height*0.035),),
          SizedBox(height: size.height*0.036,),
        Container(
          height: size.height*0.06,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color.fromARGB(188, 238, 123, 161)
          ),
          child: Center(child: Text("Statistics", style: TextStyle(fontSize: size.height*0.027),)),
        ),
         WalkingGraphDisplayTabViewWidget(device: widget.device,)
      ],
    );
  }
}