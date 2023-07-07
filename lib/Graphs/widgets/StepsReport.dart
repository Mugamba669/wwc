import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wwc/DB/HeartRateDb.dart';
import 'package:wwc/DB/StepsDb.dart';

import '../../helpers/helpers.dart';

class StepsReport extends StatefulWidget {
  final List<StepsDb> steps;

  const StepsReport({super.key, required this.steps});

  @override
  State<StepsReport> createState() => _StepsReportState();
}

class _StepsReportState extends State<StepsReport> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: widget.steps.length.toDouble() - 1,
          minY: 0,
          maxY: 200,
          titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, x) {
                    return Transform.translate(
                      offset: const Offset(-25,50),
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
              )),
              leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              ))),
          lineBarsData: [
            LineChartBarData(
              spots: widget.steps
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(
                      entry.key.toDouble(), entry.value.steps!.toDouble()))
                  .toList(),
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
