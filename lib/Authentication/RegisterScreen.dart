import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wwc/DB/Register.dart';
import 'package:wwc/helpers/helpers.dart';

import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _DOB = TextEditingController();
  final TextEditingController _bodyWeight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String selectedOption = 'Select a service';
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedWeight;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text("WWC")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Center(
                    child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: size.height * 0.029,
                      color: const Color.fromARGB(179, 0, 0, 0)),
                )),
                SizedBox(
                  height: size.height * 0.004,
                ),

                // the form field section
                //
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _username,
                    autocorrect: true,
                    // initialValue: "Ampa Ignitious",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Set the color of the border
                        width: 1.0, // Set the width of the border
                      ),
                      borderRadius:
                          BorderRadius.circular(4.0), // Set the border radius
                    ),
                    child: DropdownButton(
                      value: selectedOption,
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Select a service',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Female',
                          child: Text('Female'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                      },
                      isExpanded:
                          true, // Make the dropdown take up the full available width
                      itemHeight: 50, // Adjust the height of each dropdown item
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _DOB,
                    autocorrect: true,
                   onChanged: (x){
                      print(x);
                      showDatePicker(
    context: context,
    currentDate: DateTime.now(),
    initialDate: DateTime.now(),
    firstDate: DateTime(1960),
    lastDate: DateTime(2060),
  ).then((value) {
    _DOB.text =DateFormat('dd-MM-yyyy').format(value ?? DateTime.now());
  });
                   
                   },
                    decoration: const InputDecoration(
                      hintText: "Date of Birth",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                    // keyboardType: TextInputType.datetime,
                   
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //       RegExp(r'\d+[/]\d+[/]\d+')),
                    // ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    // initialValue: "Ampa Ignitious",
                    decoration: const InputDecoration(
                        hintText: "Height (m)",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your height';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _bodyWeight,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    // initialValue: "Ampa Ignitious",
                    decoration: InputDecoration(
                      hintText: "Body Weight (kg)",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      suffixIcon: DropdownButton<int>(
                        value: selectedWeight,
                        items: List.generate(141, (index) => index + 10)
                            .map((weight) => DropdownMenuItem<int>(
                                  value: weight,
                                  child: Text(weight.toString()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedWeight = value!;
                            _bodyWeight.text = value.toString();
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your body weight';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _phoneNumber,
                    keyboardType: TextInputType.phone,
                    autocorrect: true,
                   maxLength: 10,
                    decoration: const InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
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
                    controller: _passwordController,
                    obscureText: true,
                    maxLength: 6,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
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
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    // check if all fields have data
                    if (formKey.currentState!.validate() &&
                        _username.text.isNotEmpty &&
                        _DOB.text.isNotEmpty &&
                        _height.text.isNotEmpty &&
                        _bodyWeight.text.isNotEmpty &&
                        _phoneNumber.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      Box<Register> contactsBox = Hive.box<Register>("wwc");
                      showProgress(context, text: "Creating account.");
                      contactsBox
                          .add(
                        Register(
                          username: _username.text,
                          password: _passwordController.text,
                          gender: selectedOption,
                          dateOfBith: _DOB.text,
                          height: _height.text,
                          bodyWeight: _bodyWeight.text,
                          phoneNumber: _phoneNumber.text,
                        ),
                      )
                          .then(
                        (value) {
                          Navigator.pop(context);
                          showMessage(
                              context: context,
                              msg: "Account created successfully",
                              type: "success");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      );
                    } else {
                      showMessage(
                        context: context,
                        msg: "Please fill all the fields",
                        type: "danger",
                      );
                    }
                  },
                  child: Container(
                    height: size.height * 0.06,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width,
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
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text("Already have an account"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                  height: size.height * 0.07,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
