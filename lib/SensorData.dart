// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// Define the UUIDs
const String serviceUuid = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
const String characteristicUuidStep = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
const String characteristicUuidHeart = "c4833904-2076-4b3f-8351-92c5c980e6a7";
const String characteristicUuidTemp = "5a24c5c0-41a6-4f66-bfa4-38c050480d92";

class SensorData extends StatefulWidget {
  final List<BluetoothService> services;
  const SensorData({Key? key, required this.services}) : super(key: key);
  @override
  _SensorDataState createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
  FlutterBluePlus flutterBlue = FlutterBluePlus();
  BluetoothDevice? espDevice;
  BluetoothCharacteristic? stepCharacteristic;
  BluetoothCharacteristic? heartCharacteristic;
  BluetoothCharacteristic? tempCharacteristic;
  bool connected = false;

  @override
  void initState() {
    super.initState();
    // startScan();
  }

  void discoverTServices() async {
    // List<BluetoothService> services = await widget.services.discoverServices();
    for (var service in widget.services) {
      if (service.uuid.toString() == serviceUuid) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == characteristicUuidStep) {
            stepCharacteristic = characteristic;

            subscribeToCharacteristic(characteristic);
          } else if (characteristic.uuid.toString() ==
              characteristicUuidHeart) {
            heartCharacteristic = characteristic;
            subscribeToCharacteristic(characteristic);
          } else if (characteristic.uuid.toString() == characteristicUuidTemp) {
            tempCharacteristic = characteristic;
            subscribeToCharacteristic(characteristic);
          }
        }
      }
    }
  }

  void subscribeToCharacteristic(BluetoothCharacteristic characteristic) {
    // characteristic.setNotifyValue(true);
    characteristic.value.listen((value) {
      // Handle received value here
      if (kDebugMode) {
        print('Received value: $value');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    discoverTServices();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Connected: $connected',
        ),
      ],
    );
  }
}
