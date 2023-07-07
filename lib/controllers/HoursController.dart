import 'package:flutter/material.dart';

class HoursController with ChangeNotifier{
  int _hours = 0;
  int get hours => _hours;

    getHours(int hrs){
      _hours = hrs;
      notifyListeners();
    }
}