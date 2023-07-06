import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class StepController with ChangeNotifier {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  BluetoothCharacteristic? targetCharacteristic;
  bool connected = false;
  double target = 0;

  Future<void> discoverServicesAndCharacteristics(
      BluetoothDevice espDevice, String uid) async {
    List<BluetoothService> services = await espDevice.discoverServices();
  
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      try{
      for (var service in services) {
        if (service.uuid.toString() == "4fafc201-1fb5-459e-8fcc-c5c9c331914b") {
          for (var characteristic in service.characteristics) {
            if (characteristic.uuid.toString() == uid) {
              characteristic.read().then((value) {
                if (kDebugMode) {
                  print(
                  "Steps ${String.fromCharCodes(value)}",
                );
                }
                target = double.parse(
                  String.fromCharCodes(value),
                );
              });
              notifyListeners();
            }
          }
        }
      }
       } on PlatformException catch(e,_){
        debugPrint(e.toString());
      }
    });
  }
}
