// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wwc/helpers/helpers.dart';
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
  BluetoothDevice? device;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connected to :${device?.name}",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          StreamBuilder<BluetoothConnectionState>(
            stream: device?.state,
            initialData: BluetoothConnectionState.connecting,
            builder: (c, snapshot) {
              VoidCallback? onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothConnectionState.connected:
                  onPressed = () => device?.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothConnectionState.disconnected:
                  onPressed = () => device?.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return TextButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white),
                  ));
            },
          )
        ],
      ),
      body: device != null
          ? StreamBuilder(
              stream: FlutterBluePlus.adapterState,
              initialData: BluetoothAdapterState.unknown,
              builder: (c, snapshot) {
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.006,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  // if (state == BluetoothState.on) {
                                  return const FindDevicesScreen();
                                  // }
                                },
                              ),
                            ).then(
                              (value) {
                                setState(
                                  () {
                                    device = value;
                                  },
                                );
                                showMessage(
                                    context: context,
                                    msg: "Bluetooth connected",
                                    type: "success");
                              },
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
                              widget.device != null
                                  ? Icons.bluetooth_connected
                                  : Icons.bluetooth,
                              size: size.height * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // the menu button display

                    // heart rate
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HeartRateDisplayScreen(device: device!);
                              },
                            ),
                          );
                        },
                        child: const HeartRate()),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TemperatureDisplayScreen(
                                device: device!,
                              );
                            },
                          ),
                        );
                      },
                      child: const Temperature(),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SleepingDisplayScreen();
                            },
                          ),
                        );
                      },
                      child: const SleepingPattern(),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return WalkingDisplayScreen(
                              device: device!,
                            );
                          }),
                        );
                      },
                      child: const WalkingSteadiness(),
                    )
                  ],
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    FlutterBluePlus.isAvailable.then((value) {
                      if (value == false) {
                        FlutterBluePlus.turnOn().then((value) {
                          showMessage(
                            context: context,
                            msg: "Bluetooth connected",
                          );
                        });
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              // if (state == BluetoothState.on) {
                              return const FindDevicesScreen();
                              // }
                            },
                          ),
                        ).then(
                          (value) {
                            setState(
                              () {
                                device = value;
                              },
                            );
                          },
                        );
                      }
                    });
                    if (widget.device != null) {
                      showMessage(
                          context: context,
                          msg: "Bluetooth connected",
                          type: "success");
                    }
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
                ),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Center(
                    child: Text(
                      "Please connect to a device",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
