import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class MainController extends ChangeNotifier {
  // BluetoothDevice 
  List<BluetoothService> _currentService = [];
  double _stepValue = 0.0;
  double _heartRateValue = 0.0;
  double _temperatureValue = 0.0;
  List<BluetoothService> get currentService => _currentService;
  // step value
  double get stepValue => _stepValue;
  double get heartRateValue => _heartRateValue;
  double get temperatureValue => _temperatureValue;

  void setCurrentService(List<BluetoothService> service) {
    //        const String characteristicUuidStep =
    //     "beb5483e-36e1-4688-b7f5-ea07361b26a8";
    //  const String characteristicUuidHeart =
    //     "c4833904-2076-4b3f-8351-92c5c980e6a7";
    //  const String characteristicUuidTemp =
    //     "5a24c5c0-41a6-4f66-bfa4-38c050480d92";
    // _currentService = service;

    var ss = service
        .where((element) =>
            element.uuid.toString() == "4fafc201-1fb5-459e-8fcc-c5c9c331914b")
        .toList();
    if (ss.isNotEmpty) {
      for (var element in ss[0].characteristics) {
        if (element.uuid.toString() == "beb5483e-36e1-4688-b7f5-ea07361b26a8") {
          element.read().then((value) {
            _stepValue = double.parse(String.fromCharCodes(value));
            notifyListeners();
          });
        } else if (element.uuid.toString() ==
            "c4833904-2076-4b3f-8351-92c5c980e6a7") {
          element.read().then((value) {
            _heartRateValue = double.parse(String.fromCharCodes(value));
            notifyListeners();
          });
        } else if (element.uuid.toString() ==
            "5a24c5c0-41a6-4f66-bfa4-38c050480d92") {
          element.read().then((value) {
            _temperatureValue = double.parse(String.fromCharCodes(value));
            notifyListeners();
          });
        }
      }
    } else {
      print("Nothing to read");
    }
  }
}
