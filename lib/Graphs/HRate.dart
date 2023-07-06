// ignore_for_file: prefer_is_empty

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:wwc/controllers/HeartRateController.dart';

import '../controllers/StepController.dart';

class HRate extends StatefulWidget {
  final BluetoothDevice device;
  const HRate({super.key, required this.device});

  @override
  State<HRate> createState() => _HRateState();
}

class _HRateState extends State<HRate> {
  List<double> data = [];
  void initState() {
    connectToBtDevice(widget.device);
    super.initState();
  }

  void connectToBtDevice(BluetoothDevice device) async {
    HeartRateController esp32Provider =
        Provider.of<HeartRateController>(context, listen: false);
    await esp32Provider.discoverServicesAndCharacteristics(
        device, "c4833904-2076-4b3f-8351-92c5c980e6a7");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<HeartRateController>(
              builder: (context, value, _) {
                data.add(value.heartRate);
                return Text(
                  'Heart Rate: ${value.heartRate.toString()} bpm',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top:38.0,bottom:38.0),
              child: Consumer<HeartRateController>(builder: (context, value, x) {
                return SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: LineChart(
                    LineChartData(
                      titlesData: const FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: data.length < 0
                              ? []
                              : List.generate(
                                  data.length,
                                  (index) => FlSpot(
                                    index.toDouble(),
                                    data[index],
                                  ),
                                ), // List of data points (time and number of steps)
                          isCurved: true,
                          color: Colors.blue,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
