import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wwc/DB/HeartRateDb.dart';
import '/Graphs/widgets/HeartRateReport.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<double> heartRates = [100, 120, 130, 110, 140, 120, 150, 160, 130];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Heart Rate Reports",
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
            valueListenable: Hive.box<HeartRateDb>("wwc").listenable(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Temperature Reports",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
