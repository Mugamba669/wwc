import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/TemperatureController.dart';

class Temperature extends StatefulWidget {
  final BluetoothDevice device;
  const Temperature({super.key, required this.device});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  @override
  void initState() {
    connectToBtDevice(widget.device);
    super.initState();
  }

  void connectToBtDevice(BluetoothDevice device) async {
    TemperatureController esp32Provider =
        Provider.of<TemperatureController>(context, listen: false);
    await esp32Provider.discoverServicesAndCharacteristics(
        device, "5a24c5c0-41a6-4f66-bfa4-38c050480d92");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<TemperatureController>(
              builder: (context, value, _) {
                return SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0, endValue: 50, color: Colors.green),
                      GaugeRange(
                          startValue: 50, endValue: 100, color: Colors.orange),
                      GaugeRange(
                          startValue: 100, endValue: 150, color: Colors.red)
                    ], pointers: <GaugePointer>[
                      NeedlePointer(value: value.temperature)
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          '${value.temperature} °C',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      )
                    ])
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
