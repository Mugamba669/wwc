import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wwc/DB/StepsDb.dart';

import '../../helpers/helpers.dart';

class StepsReport extends StatefulWidget {
  const StepsReport({super.key, required this.steps, this.height = 300});

  final double? height;
  final List<StepsDb> steps;

  @override
  State<StepsReport> createState() => _StepsReportState();
}

class _StepsReportState extends State<StepsReport> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: widget.steps.length.toDouble() - 1,
          minY: 0,
          maxY: 1000,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              // axisName Widget: const Text("DateTime"),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, x) {
                  return Transform.translate(
                    offset: const Offset(-25, 50),
                    child: Transform.rotate(
                      angle: -45,
                      child: Text(
                        formatDateTime(
                          DateTime.parse(
                            widget.steps[value.toInt()].date.toString(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: widget.steps
                  .asMap()
                  .entries
                  .map(
                    (entry) => FlSpot(
                      entry.key.toDouble(),
                      entry.value.steps!.toDouble(),
                    ),
                  )
                  .toList(),
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              dotData: const FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
