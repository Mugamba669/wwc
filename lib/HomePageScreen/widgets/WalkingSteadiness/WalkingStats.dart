import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/DB/StepsDb.dart';
import '/Graphs/widgets/StepsReport.dart';


class WalkingStats extends StatefulWidget {
  const WalkingStats({super.key});

  @override
  State<WalkingStats> createState() => _WalkingStatsState();
}

class _WalkingStatsState extends State<WalkingStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Walking Steadiness stats"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ValueListenableBuilder(
          builder: (context, box, _) {
            return box.values.isEmpty
                ? const Center(
                    child: Text("No steps data recorded"),
                  )
                : StepsReport(
                    height: MediaQuery.of(context).size.height * 0.6,
                    steps: box.values.toList(),
                  );
          },
          valueListenable: Hive.box<StepsDb>("step").listenable(),
        ),
      ),
    );
  }
}
