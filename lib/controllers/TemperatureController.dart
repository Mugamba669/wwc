import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class TemperatureController with ChangeNotifier {
  FlutterBluePlus flutterBlue = FlutterBluePlus();

  BluetoothCharacteristic? targetCharacteristic;
  bool connected = false;
  double temperature = 0.0;
  Timer? readTimer;

  Future<void> discoverServicesAndCharacteristics(
      BluetoothDevice espDevice, String uid) async {
    List<BluetoothService> services = await espDevice.discoverServices();

    for (var service in services) {
      if (service.uuid.toString() == "4fafc201-1fb5-459e-8fcc-c5c9c331914b") {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == uid) {
            if (characteristic.properties.read) {
              readTemperature(characteristic);
            }
          }
        }
      }
    }
  }

  void readTemperature(BluetoothCharacteristic characteristic) {
    readTimer?.cancel();

    readTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      try {
        await characteristic.read();
      } on PlatformException catch (e) {
        debugPrint(e.toString());
        return;
      }
    });

    characteristic.value.listen((value) {
      if (value.isNotEmpty) {
        try {
          temperature = double.parse(String.fromCharCodes(value));
          notifyListeners();
        } on Exception catch (e) {
          debugPrint(e.toString());
        }
      }
    });
  }

  void dispose() {
    readTimer?.cancel();
  }
}
