import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '/pages/BluetoothOffScreen.dart';
import '/pages/FindDeviceScreen.dart';
import '/HomePageScreen/widgets/HeartRatePage/HeartRate.dart';
import '/HomePageScreen/widgets/HeartRatePage/HeartRateDisplayScreen.dart';
import '/HomePageScreen/widgets/SleepingPattern.dart';
import '/HomePageScreen/widgets/SleepingPatternPage/SleepingDisplayScreen.dart';
import '/HomePageScreen/widgets/TemperaturePage/Temperature.dart';
import '/HomePageScreen/widgets/TemperaturePage/TemperatureDisplayScreen.dart';
import '/HomePageScreen/widgets/WalkingSteadiness.dart';
import '/HomePageScreen/widgets/WalkingSteadiness/WalkingDisplayScreen.dart';

class DefaultHomePage extends StatefulWidget {
  final BluetoothDevice? device;
  const DefaultHomePage({super.key, this.device});

  @override
  State<DefaultHomePage> createState() => _DefaultHomePageState();
}

class _DefaultHomePageState extends State<DefaultHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: FlutterBluePlus.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          final state = snapshot.data;
          return Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.006,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(left: size.width * 0.37),
                          height: size.height * 0.2,
                          width: size.width * 0.24,
                          decoration: const BoxDecoration(
                              // color: Colors.blue,
                              ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage("assets/logoWWC.png"),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              if (state == BluetoothState.on) {
                                return const FindDevicesScreen();
                              }
                              return BluetoothOffScreen(state: state);
                            }),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: size.width * 0.04),
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.bluetooth,
                            size: size.height * 0.04,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  // the menu button display
                  // heart rate
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HeartRateDisplayScreen();
                        }));
                      },
                      child: const HeartRate()),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TemperatureDisplayScreen();
                        }));
                      },
                      child: const Temperature()),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SleepingDisplayScreen();
                        }));
                      },
                      child: const SleepingPattern()),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const WalkingDisplayScreen();
                        }));
                      },
                      child: const WalkingSteadiness())
                ],
              )
            ],
          );
        });
  }
}
