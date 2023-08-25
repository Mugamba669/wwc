import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wwc/DB/TemperatureDb.dart';
import 'package:wwc/HomePageScreen/widgets/TemperaturePage/TemperateStats.dart';
import 'package:wwc/controllers/TemperatureController.dart';

import 'TemperatureGraphDisplayTabViewWidget.dart';

class TemperatureMeasureWidgetPage extends StatefulWidget {
  final BluetoothDevice device;
  const TemperatureMeasureWidgetPage({super.key, required this.device});

  @override
  State<TemperatureMeasureWidgetPage> createState() =>
      _TemperatureMeasureWidgetPageState();
}

class _TemperatureMeasureWidgetPageState
    extends State<TemperatureMeasureWidgetPage> {
      Timer? _timer;

      @override
      void dispose() { 
        super.dispose();
        _timer?.cancel();
      }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer<TemperatureController>(builder: (context, temp, x) {
       _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
          Box<TemperatureDb> tmp = Hive.box<TemperatureDb>("temperature");
          tmp.add(
            TemperatureDb(
              uid: widget.device.id.toString(),
              temperature: temp.temperature,
              date: DateTime.now().toString(),
            ),
          );
        });
        return Column(
          children: [
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              "Temperature: ${temp.temperature}°C",
              style: TextStyle(fontSize: size.height * 0.035),
            ),
            SizedBox(
              height: size.height * 0.036,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TemperatureStats(),
                  ),
                );
              },
              child: Container(
                height: size.height * 0.06,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(188, 238, 123, 161),
                ),
                child: Center(
                  child: Text(
                    "Statistics",
                    style: TextStyle(fontSize: size.height * 0.027),
                  ),
                ),
              ),
            ),
            TemperatureGraphDisplayTabViewWidget(
              device: widget.device,
            )
          ],
        );
      }),
    );
  }
}
