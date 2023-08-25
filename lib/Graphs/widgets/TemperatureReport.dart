import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wwc/DB/TemperatureDb.dart';

import '../../helpers/helpers.dart';

class TemperatureReport extends StatefulWidget {
  final List<TemperatureDb> temperature;
  final double? height;

  const TemperatureReport(
      {super.key, required this.temperature, this.height = 300});

  @override
  State<TemperatureReport> createState() => _TemperatureReportState();
}

class _TemperatureReportState extends State<TemperatureReport> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: widget.temperature.length.toDouble() - 1,
          minY: 0,
          maxY: 200,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, x) {
                  return Transform.translate(
                    offset: const Offset(-25, 50),
                    child: Transform.rotate(
                      angle: -45,
                      child: Text(
                        formatDateTime(DateTime.parse(
                            widget.temperature[value.toInt()].date.toString())),
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
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: widget.temperature
                  .asMap()
                  .entries
                  .map(
                    (entry) => FlSpot(
                      entry.key.toDouble(),
                      entry.value.temperature!.toDouble(),
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
