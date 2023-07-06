// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wwc/controllers/StepController.dart';

class StepCount extends StatefulWidget {
  final BluetoothDevice device;
  const StepCount({super.key, required this.device});

  @override
  State<StepCount> createState() => _StepCountState();
}

class _StepCountState extends State<StepCount> {
  @override
  void initState() {
    connectToBtDevice(widget.device);
    super.initState();
  }

  void connectToBtDevice(BluetoothDevice device) async {
    StepController esp32Provider =
        Provider.of<StepController>(context, listen: false);
    await esp32Provider.discoverServicesAndCharacteristics(
        device, "beb5483e-36e1-4688-b7f5-ea07361b26a8");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step Count Graph"),
      ),
      body: Consumer<StepController>(builder: (context, step, x) {
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
                      cornerStyle: CornerStyle.bothCurve)
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                              ),
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
    );
  }
}
