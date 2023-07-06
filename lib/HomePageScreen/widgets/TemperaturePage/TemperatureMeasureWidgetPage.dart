import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'TemperatureGraphDisplayTabViewWidget.dart';


class TemperatureMeasureWidgetPage extends StatefulWidget {
  final BluetoothDevice device;
  const TemperatureMeasureWidgetPage({super.key, required this.device});

  @override
  State<TemperatureMeasureWidgetPage> createState() => _TemperatureMeasureWidgetPageState();
}

class _TemperatureMeasureWidgetPageState extends State<TemperatureMeasureWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height*0.025,),
          Text("Temperature: 23C", style: TextStyle(fontSize: size.height*0.035),),
            SizedBox(height: size.height*0.036,),
          Container(
            height: size.height*0.06,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color.fromARGB(188, 238, 123, 161)
            ),
            child: Center(child: Text("Statistics", style: TextStyle(fontSize: size.height*0.027),)),
          ),
           TemperatureGraphDisplayTabViewWidget(device:widget.device)
        ],
      ),
    );
  }
}