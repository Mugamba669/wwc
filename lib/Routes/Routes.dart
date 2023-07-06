import 'package:flutter/material.dart';

import '../Authentication/LoginScreen.dart';
import '../Authentication/RegisterScreen.dart';
import '../HomePageScreen/HomeScreen.dart';

class Routes {
  static String login = '/login';
  static String register = '/register';
  static String home = '/home';

  static Map<String, Widget Function(BuildContext)> routes(
      BuildContext context) {
    return {
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}
