// ignore_for_file: file_names

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wwc/DB/StepsDb.dart';
import 'package:wwc/controllers/StepController.dart';

class StepCount extends StatefulWidget {
  final BluetoothDevice device;
  const StepCount({super.key, required this.device});

  @override
  State<StepCount> createState() => _StepCountState();
}

class _StepCountState extends State<StepCount> {
  StepController? controller;
  Timer? _timer;
  @override
  void initState() {
    connectToBtDevice(widget.device);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void connectToBtDevice(BluetoothDevice device) async {
    StepController esp32Provider =
        Provider.of<StepController>(context, listen: false);
    await esp32Provider.discoverServicesAndCharacteristics(
        device, "beb5483e-36e1-4688-b7f5-ea07361b26a8");
    setState(() {
      controller = esp32Provider;
    });
  }

   void resetSensorValue() async {
    if (controller?.targetCharacteristic != null) {
      //  final math = Random();
    // List<int> x = [
    //   math.nextInt(255),
    //   math.nextInt(255),
    //   math.nextInt(255),
    //   math.nextInt(255)
    // ];
      // List<int> command = [0x00, 0x00, 0x00, 0x00]; // Customize the reset command
      await controller?.targetCharacteristic!.write([0x12, 0x34]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StepController>(builder: (context, step, x) {
     _timer =  Timer.periodic(const Duration(seconds: 8), (timer) {
          Box<StepsDb> box = Hive.box<StepsDb>("step");
          box.add(
            StepsDb(
              date: DateTime.now().toString(),
              steps: step.target,
              uid: widget.device.id.toString(),
            ),
          );
          //
         
          _timer?.cancel();
        });
        return SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
                interval: 10,
                maximum: 1000,
                radiusFactor: 0.95,
                startAngle: 0,
                endAngle: 360,
                showTicks: false,
                showLabels: false,
                axisLineStyle: const AxisLineStyle(thickness: 20),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: step.target.toDouble(),
                    width: 20,
                    color: const Color(0xFFFFCD60),
                    enableAnimation: true,
                    gradient: const SweepGradient(
                        colors: [Color(0xFFFCE38A), Color(0xFFF38181)],
                        stops: <double>[0.25, 0.75]),
                    cornerStyle: CornerStyle.bothCurve,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // Added image widget as an annotation
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                            child: RichText(
                              text: TextSpan(
                                  text: step.target.toInt().toString(),
                                  children: const [
                                    TextSpan(
                                      text: " Steps",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                  ],
                                  style: const TextStyle(
                                      fontSize: 65,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                      angle: 270,
                      positionFactor: 0.1)
                ])
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: resetSensorValue,
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
