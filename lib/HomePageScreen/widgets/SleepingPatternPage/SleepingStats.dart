import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../DB/HoursDb.dart';
import '../../../Graphs/widgets/HoursSlept.dart';

class SleepingStats extends StatefulWidget {
  const SleepingStats({super.key});

  @override
  State<SleepingStats> createState() => _SleepingStatsState();
}

class _SleepingStatsState extends State<SleepingStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sleeping Pattern cumulative report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ValueListenableBuilder(
          builder: (context, box, _) {
            return box.values.isEmpty
                ? const Center(
                    child: Text("No hours slept data"),
                  )
                : HoursReport(
                  height: MediaQuery.of(context).size.height * 0.6,
                    time: box.values.toList(),
                  );
          },
          valueListenable: Hive.box<HoursDb>("hours").listenable(),
        ),
      ),
    );
  }
}
