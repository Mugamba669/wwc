import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wwc/helpers/helpers.dart';

import '../DB/Register.dart';
import '/HomePageScreen/HomeScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: non_constant_identifier_names
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leading: const Text(''),
          backgroundColor: Colors.blue,
          title: const Text("WWC")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Center(
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.26,
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/logoWWC.png"),
                    ),
                  ),
                ),
                Text(
                  "Wearable Wellness Checker",
                  style: TextStyle(
                      fontSize: size.height * 0.029,
                      color: const Color.fromARGB(179, 0, 0, 0)),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),

                // the form field section
                //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                // end of form field
                //
                SizedBox(
                  height: size.height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    // check if all fields have data
                    if (formKey.currentState!.validate() &&
                        usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      Hive.openBox<Register>("wwc").then((box) {
                        for (var result in box.values) {
                          print(result.username ?? "Nothing");
                          if (result.username == usernameController.text &&
                              result.password == passwordController.text) {
                            SharedPreferences.getInstance().then((value) {
                              value.setString(
                                  "userId", usernameController.text);
                            });
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                                return const HomeScreen();
                              }),
                            );
                          } else {
                            showMessage(
                              context: context,
                              msg: "Invalid username or password",
                              type: "danger",
                            );
                          }
                        }
                      });
                    } else {
                      showMessage(
                          context: context,
                          msg: "Please fill all the fields",
                          type: "danger");
                    }
                  },
                  child: Container(
                    height: size.height * 0.06,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.023,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text("New to WWC?"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }),
                    );
                  },
                  child: Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text(
                      "CREATE ACCOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.023,
                      ),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
