import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wwc/DB/HoursDb.dart';

import '../../../controllers/HoursController.dart';
import '../../../helpers/helpers.dart';

class SleepingGraphDisplayTabViewWidget extends StatefulWidget {
  const SleepingGraphDisplayTabViewWidget({super.key});

  @override
  State<SleepingGraphDisplayTabViewWidget> createState() =>
      _SleepingGraphDisplayTabViewWidgetState();
}

class _SleepingGraphDisplayTabViewWidgetState
    extends State<SleepingGraphDisplayTabViewWidget>
    with TickerProviderStateMixin {
  TimeOfDay? time;
  TimeOfDay? wakeUpTime;
  int hours = 0;
  @override
  Widget build(BuildContext context) {
    TabController tab2Controller = TabController(length: 1, vsync: this);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.009,
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              controller: tab2Controller,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black26,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: const TextStyle(fontSize: 20, color: Colors.white),
              tabs: const [
                Tab(text: "Sleeping Calculator"),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, bottom: 25, right: 20, top: 10),
            height: size.height * 0.32,
            width: double.maxFinite,
            decoration: const BoxDecoration(),
            child: TabBarView(
              controller: tab2Controller,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Time for bed:",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          time == null
                              ? "--:--:--"
                              : "${time?.hour.toString()} : ${time?.minute.toString()}",
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          setState(() {
                            time = value;
                          });
                        });
                      },
                      child: const Text("Select time for bed"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Time for waking up:",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          wakeUpTime == null
                              ? "--:--:--"
                              : "${wakeUpTime?.hour.toString()} : ${wakeUpTime?.minute.toString()}",
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          setState(() {
                            wakeUpTime = value;
                          });
                        });
                      },
                      child: const Text("Select time for waking up"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        final startTime =
                            TimeOfDay(hour: time!.hour, minute: time!.minute);
                        final endTime = TimeOfDay(
                            hour: wakeUpTime!.hour, minute: wakeUpTime!.minute);
                        setState(() {
                          hours = computeHoursSpent(startTime, endTime);
                        });
                        Provider.of<HoursController>(context, listen: false)
                            .getHours(hours);

                        Hive.box<HoursDb>("hours").add(
                          HoursDb(
                            hours: hours,
                            date: DateTime.now().toString(),
                          ),
                        );
                      },
                      child: const Text(
                        "Calculate Time",
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
