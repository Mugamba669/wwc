import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HeartRateController with ChangeNotifier {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  BluetoothCharacteristic? targetCharacteristic;
  bool connected = false;
  double heartRate = 0.0;
  late Timer _timer;

  Future<void> discoverServicesAndCharacteristics(
      BluetoothDevice espDevice, String uid) async {
    List<BluetoothService> services = await espDevice.discoverServices();

    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) async {
      try {
        for (var service in services) {
          if (service.uuid.toString() ==
              "4fafc201-1fb5-459e-8fcc-c5c9c331914b") {
            for (var characteristic in service.characteristics) {
              if (characteristic.uuid.toString() == uid) {
                if (characteristic.properties.read) {
                  try {
                    var value = await characteristic.read();
                    if (value.isNotEmpty) {
                      heartRate = double.parse(String.fromCharCodes(value));
                      notifyListeners();
                    }
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                }
              }
            }
          }
        }
      } on PlatformException catch (e, _) {
        debugPrint(e.toString());
      }
    });
  }

  void dispose() {
    _timer.cancel();
  }
}
