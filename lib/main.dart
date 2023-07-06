// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wwc/DB/Register.dart';
import 'package:wwc/Routes/Routes.dart';
import 'package:wwc/controllers/TemperatureController.dart';
import 'package:wwc/observer/AppObserver.dart';
import 'package:wwc/pages/BluetoothOffScreen.dart';

import 'controllers/StepController.dart';
import 'controllers/HeartRateController.dart';
import 'controllers/MainController.dart';
import 'pages/FindDeviceScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter<Contact>(ContactAdapter());
  Hive.registerAdapter<Register>(RegisterAdapter());
  await Hive.openBox<Register>("wwc");
  AppObserver bloc = const AppObserver();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan
    ].request().then((status) {
      runApp(
        MultiBlocProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => MainController(),
            ),
            ChangeNotifierProvider(
              create: (_) => StepController(),
            ),
            ChangeNotifierProvider(
              create: (_) => TemperatureController(),
            ),
            ChangeNotifierProvider(
              create: (_) => HeartRateController(),
            )
          ],
          child: Builder(builder: (context) {
            return MaterialApp(
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.blue,
                  ),
                  useMaterial3: true),
              debugShowCheckedModeBanner: false,
              initialRoute:prefs.getString("userId") == null ? Routes.login : Routes.home,
              // home: StreamBuilder<BluetoothState>(
              //     stream: FlutterBluePlus.instance.state,
              //     initialData: BluetoothState.unknown,
              //     builder: (c, snapshot) {
              //       final state = snapshot.data;
              //       if (state == BluetoothState.on) {
              //         return const FindDevicesScreen();
              //       }
              //       return BluetoothOffScreen(state: state);
              //     }),
              routes: Routes.routes(context),
            );
          }),
        ),
      );
    });
  }
}
