import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../DB/TemperatureDb.dart';
import '../controllers/TemperatureController.dart';

class Temperature extends StatefulWidget {
  final BluetoothDevice device;
  const Temperature({super.key, required this.device});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  TemperatureController? controller;
  Timer? timer;
  @override
  void initState() {
    connectToBtDevice(widget.device);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    timer?.cancel();
    super.dispose();
  }

  void connectToBtDevice(BluetoothDevice device) async {
    TemperatureController esp32Provider =
        Provider.of<TemperatureController>(context, listen: false);
    await esp32Provider.discoverServicesAndCharacteristics(
        device, "5a24c5c0-41a6-4f66-bfa4-38c050480d92");
    setState(() {
      controller = esp32Provider;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<TemperatureController>(
              builder: (context, value, _) {
               timer = Timer.periodic(const Duration(seconds: 4), (timer) {
                  Hive.box<TemperatureDb>("temperature").add(TemperatureDb(
                    date: DateTime.now().toString(),
                    temperature: value.temperature,
                    uid: widget.device.id.toString(),
                  ));
                });
                return SfRadialGauge(
                  // title: const GaugeTitle(text: "Temp"),
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 33, maximum: 40, ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 33, endValue: 36.1, color: Colors.blue),
                      GaugeRange(
                          startValue: 36.1,
                          endValue: 37.2,
                          color: Colors.green),
                      GaugeRange(
                          startValue: 37.2, endValue: 40, color: Colors.red)
                    ], pointers: <GaugePointer>[
                      NeedlePointer(value: value.temperature)
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          '${value.temperature} °C',
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      )
                    ])
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.blue),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Low body temperature"),
                ),
              ],
            ),
              const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.green),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Normal body temperature"),
                ),
              ],
            ),
              const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.red),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("High body temperature"),
                ),
              ],
            ),
             const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
