import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../DB/HeartRateDb.dart';
import '../../../DB/StepsDb.dart';
import '../../../Graphs/widgets/HeartRateReport.dart';
import '../../../Graphs/widgets/StepsReport.dart';

class HeartRateStats extends StatefulWidget {
  const HeartRateStats({super.key});

  @override
  State<HeartRateStats> createState() => _HeartRateStatsState();
}

class _HeartRateStatsState extends State<HeartRateStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Rate stats"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ValueListenableBuilder(
            builder: (context, box, _) {
              return box.values.isEmpty
                  ? const Center(
                      child: Text("No heart rate data"),
                    )
                  : HeartRateReportChart(
                    height: MediaQuery.of(context).size.height * 0.6,
                      heartRates: box.values.toList(),
                    );
            },
            valueListenable: Hive.box<HeartRateDb>("heart").listenable(),
          ),
        ),
    );
  }
}
