import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wwc/DB/HeartRateDb.dart';
import 'package:wwc/DB/StepsDb.dart';
import 'package:wwc/DB/TemperatureDb.dart';
import 'package:wwc/Graphs/widgets/StepsReport.dart';
import 'package:wwc/Graphs/widgets/TemperatureReport.dart';
import '/Graphs/widgets/HeartRateReport.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // final List<double> heartRates = [100, 120, 130, 110, 140, 120, 150, 160, 130];
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Cumulative Heart Rate Historical Data Report",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ValueListenableBuilder(
            builder: (context, box, _) {
              return box.values.isEmpty
                  ? const Center(
                      child: Text("No heart rate data"),
                    )
                  : HeartRateReportChart(
                      heartRates: box.values.toList(),
                    );
            },
            valueListenable: Hive.box<HeartRateDb>("heart").listenable(),
          ),
        ),
         SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Cumulative Temperature  Historical Data Report",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ValueListenableBuilder(
            builder: (context, box, _) {
              return box.values.isEmpty
                  ? const Center(
                      child: Text("No heart rate data"),
                    )
                  : TemperatureReport(
                      temperature: box.values.toList(),
                    );
            },
            valueListenable:
                Hive.box<TemperatureDb>("temperature").listenable(),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Cumulative Steps Historical Data Report",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ValueListenableBuilder(
            builder: (context, box, _) {
              return box.values.isEmpty
                  ? const Center(
                      child: Text("No heart rate data"),
                    )
                  : StepsReport(
                      steps: box.values.toList(),
                    );
            },
            valueListenable: Hive.box<StepsDb>("step").listenable(),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
        ),

           SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Cumulative Hours slept Historical Data Report",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ValueListenableBuilder(
            builder: (context, box, _) {
              return box.values.isEmpty
                  ? const Center(
                      child: Text("No hours slept data"),
                    )
                  : StepsReport(
                      steps: box.values.toList(),
                    );
            },
            valueListenable: Hive.box<StepsDb>("step").listenable(),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
        ),
      ],
    );
  }
}
