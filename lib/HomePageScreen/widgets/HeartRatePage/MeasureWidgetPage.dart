import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:wwc/Graphs/HeartRate.dart';
import 'package:wwc/controllers/HeartRateController.dart';

import 'GraphDisplayTabViewWidget.dart';

 

class MeasureWidgetPage extends StatefulWidget {
  final BluetoothDevice device;
  const MeasureWidgetPage({super.key, required this.device});

  @override
  State<MeasureWidgetPage> createState() => _MeasureWidgetPageState();
}

class _MeasureWidgetPageState extends State<MeasureWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HeartRateController>(
      builder: (context,rate,x) {
        return Column(
          children: [
            SizedBox(height: size.height*0.025,),
            Text("Heart:${rate.heartRate.toInt()} bpm", style: TextStyle(fontSize: size.height*0.035),),
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
             GraphDisplayTabViewWidget(device: widget.device,)
          ],
        );
      }
    );
  }
}