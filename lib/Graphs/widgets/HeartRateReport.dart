import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wwc/DB/HeartRateDb.dart';
import 'package:wwc/helpers/helpers.dart';

class HeartRateReportChart extends StatefulWidget {
  final List<HeartRateDb> heartRates;
  final double? height;

  const HeartRateReportChart(
      {super.key, required this.heartRates, this.height = 300});

  @override
  State<HeartRateReportChart> createState() => _HeartRateReportChartState();
}

class _HeartRateReportChartState extends State<HeartRateReportChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: widget.heartRates.length.toDouble() - 1,
          minY: 0,
          maxY: 60,
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
                            widget.heartRates[value.toInt()].date.toString())),
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
              spots: widget.heartRates
                  .asMap()
                  .entries
                  .map(
                    (entry) => FlSpot(
                      entry.key.toDouble(),
                      entry.value.heartRate!.toDouble(),
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
