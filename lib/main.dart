// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wwc/DB/Register.dart';
import 'package:wwc/Routes/Routes.dart';
import 'package:wwc/controllers/TemperatureController.dart';

import 'controllers/StepController.dart';
import 'controllers/HeartRateController.dart';
import 'controllers/MainController.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Register>(RegisterAdapter());
  await Hive.openBox<Register>("wwc");

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
              routes: Routes.routes(context),
            );
          }),
        ),
      );
    });
  }
}
