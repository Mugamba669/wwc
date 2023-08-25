// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/DB/TemperatureDb.dart';
import '/Graphs/widgets/TemperatureReport.dart';

class TemperatureStats extends StatefulWidget {
  const TemperatureStats({super.key});

  @override
  State<TemperatureStats> createState() => _TemperatureStatsState();
}

class _TemperatureStatsState extends State<TemperatureStats> {
  @override
  void dispose() { 
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Stats."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ValueListenableBuilder(
          builder: (context, box, _) {
            return box.values.isEmpty
                ? const Center(
                    child: Text("No temperature data"),
                  )
                : TemperatureReport(
                    height: MediaQuery.of(context).size.height * 0.6,
                    temperature: box.values.toList(),
                  );
          },
          valueListenable: Hive.box<TemperatureDb>("temperature").listenable(),
        ),
      ),
    );
  }
}
