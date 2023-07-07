import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wwc/DB/TemperatureDb.dart';

class TemperatureReport extends StatefulWidget {
  final List<TemperatureDb> temperature;

  const TemperatureReport({super.key, required this.temperature});

  @override
  State<TemperatureReport> createState() => _TemperatureReportState();
}

class _TemperatureReportState extends State<TemperatureReport> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
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
                  return Text(widget.temperature[value.toInt()].toString());
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              )
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              )
            )
          ),
          lineBarsData: [
            LineChartBarData(
              spots: widget.temperature
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value.temperature!.toDouble()))
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
