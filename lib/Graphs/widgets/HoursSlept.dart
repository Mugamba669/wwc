import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wwc/DB/HoursDb.dart';

import '../../helpers/helpers.dart';

class HoursReport extends StatefulWidget {
  final double? height;
  final List<HoursDb> time;

  const HoursReport({super.key, required this.time, this.height = 300});

  @override
  State<HoursReport> createState() => _HoursReportState();
}

class _HoursReportState extends State<HoursReport> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:widget.height,
      width: MediaQuery.of(context).size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: widget.time.length.toDouble() - 1,
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
                          formatDateTime(DateTime.parse(widget.time[value.toInt()].date.toString())),
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
              spots: widget.time
                  .asMap()
                  .entries
                  .map(
                    (entry) => FlSpot(
                      entry.key.toDouble(),
                      entry.value.hours!.toDouble(),
                    ),
                  )
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
