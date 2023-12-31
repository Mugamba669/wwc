import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwc/HomePageScreen/widgets/SleepingPatternPage/SleepingStats.dart';
import 'package:wwc/controllers/HoursController.dart';

import 'SleepingGraphDisplayTabViewWidget.dart';

class SleepingMeasureWidgetPage extends StatefulWidget {
  const SleepingMeasureWidgetPage({super.key});

  @override
  State<SleepingMeasureWidgetPage> createState() =>
      _SleepingMeasureWidgetPageState();
}

class _SleepingMeasureWidgetPageState extends State<SleepingMeasureWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HoursController>(builder: (context, hours, y) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              "Hours slept : ${hours.hours} hrs",
              style: TextStyle(fontSize: size.height * 0.035),
            ),
            SizedBox(
              height: size.height * 0.036,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SleepingStats(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Container(
                height: size.height * 0.06,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(188, 238, 123, 161)),
                child: Center(
                    child: Text(
                  "Statistics",
                  style: TextStyle(fontSize: size.height * 0.027),
                )),
              ),
            ),
            const SingleChildScrollView(child: SleepingGraphDisplayTabViewWidget())
          ],
        ),
      );
    });
  }
}
