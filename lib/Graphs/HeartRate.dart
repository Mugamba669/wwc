import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:wwc/controllers/MainController.dart';

class MonthlyPayment {
  final String month;
  final double payment;

  MonthlyPayment(this.month, this.payment);
}

class LineGraph extends StatelessWidget {
  final List<MonthlyPayment> data;

  const LineGraph(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(enabled: true),
            gridData: const FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  getTitlesWidget: (x, value) {
                    return Transform.translate(
                      offset: const Offset(10, 40),
                      child: Transform.rotate(
                        angle: 45,
                        child: const Text(
                          "",
                          // DateTime.parse(data[x.toInt()].month),

                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // leftTitles: const AxisTitles(
            //   sideTitles: SideTitles(  // <-- HERE
            //     showTitles: true,
            //   ),
            // )),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.black),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: data
                    .asMap()
                    .entries
                    .map((entry) =>
                        FlSpot(entry.key.toDouble(), entry.value.payment))
                    .toList(),
                isCurved: true,
                barWidth: 2,
                dotData: const FlDotData(show: true),
              ),
            ],
          ),
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInCubic,
        ),
      ],
    );
  }
}

class HeartRate extends StatefulWidget {
  const HeartRate({super.key, required this.characteristic});
  final BluetoothCharacteristic characteristic;

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  @override
  Widget build(BuildContext context) {
    List<MonthlyPayment> paymentData = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rate Graph'),
      ),
      body: StreamBuilder(
        stream:null,// context.read<MainController>().currentService,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var d = snapshot.data;
            // paymentData = List.generate(
            //   0,
            //   (x) => MonthlyPayment(
            //     d[x].data()['date'],
            //     double.parse(
            //       d[x].data()['amountPaid'],
            //     ),
            //   ),
            // );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.width,
                //   width: 200,
                //   child: LineGraph(paymentData),
                // ),
                // const Space(space: 0.08),
                const ListTile(
                  title: Text(
                    "Dates of Payment",
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: Text(
                    "Amount paid",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const Divider(),
                ...List.generate(
                  paymentData.length,
                  (index) => ListTile(
                    title: Text(
                        DateTime.parse(paymentData[index].month).toString(),

                      style:const TextStyle(),
                    ),
                    subtitle: const Text("",
                      // formatTime(
                      //   DateTime.parse(paymentData[index].month),
                      // ),
                      style: TextStyle(),
                    ),
                    trailing: Text(
                      paymentData[index].payment.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
