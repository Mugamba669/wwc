import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class TemperatureController with ChangeNotifier {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  BluetoothCharacteristic? targetCharacteristic;
  bool connected = false;
  double temperature = 0.0;

  Future<void> discoverServicesAndCharacteristics(
      BluetoothDevice espDevice, String uid) async {
    List<BluetoothService> services = await espDevice!.discoverServices();

    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      try {
        services.forEach((service) {
          if (service.uuid.toString() ==
              "4fafc201-1fb5-459e-8fcc-c5c9c331914b") {
            service.characteristics.forEach((characteristic) {
              if (characteristic.uuid.toString() == uid) {
                characteristic.read().then((value) {
                  temperature = double.parse(String.fromCharCodes(value));
                });
                notifyListeners();
              }
            });
          }
        });
      } on PlatformException catch (e, _) {
        debugPrint(e.toString());
      }
    });
  }
}
