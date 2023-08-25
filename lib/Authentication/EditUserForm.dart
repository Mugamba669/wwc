// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class EditUserForm extends StatefulWidget {
  const EditUserForm({super.key});

  @override
  State<EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  TextEditingController? _username;
 TextEditingController? _gender;
   TextEditingController? _DOB;
   TextEditingController? _bodyWeight;
  TextEditingController? _height;
   TextEditingController? _phoneNumber;
   TextEditingController? _passwordController;
  String selectedOption = 'Select a service';
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedWeight;
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("Edit user data")),
      body: SingleChildScrollView(
        child: Column(
          children: [
          //   SizedBox(height: size.height*0.01,),
          //   Center(child: Text("Edit users data", style: TextStyle(fontSize: size.height*0.029, color: Color.fromARGB(179, 0, 0, 0)),)),
          // SizedBox(height: size.height*0.004,),
          
          // the form field section
          // 
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: TextFormField(
                    controller: _username,
                    autocorrect: true,
                    
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                    ),
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
            padding: EdgeInsets.symmetric(horizontal: 10),
             decoration: BoxDecoration(
               border: Border.all(
                 color: Colors.grey, // Set the color of the border
                 width: 1.0, // Set the width of the border
               ),
               borderRadius: BorderRadius.circular(4.0), // Set the border radius
             ),
              
               child: DropdownButton(
                value: selectedOption,
                items: [
                      DropdownMenuItem<String>(
                        value: 'Select a service',
                        child: Text('Male'),
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Female'),
                        value: 'Female',
                      ),
                
                ],
                onChanged: (value) {
                      setState(() {
                        selectedOption = value.toString();
                      });
                },
                  isExpanded: true, // Make the dropdown take up the full available width
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
    // initialValue: "Ampa Ignitious",
    decoration: InputDecoration(
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
    keyboardType: TextInputType.datetime,
    onChanged: (value) {
      final formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(value));
      print(formattedDate);
      // Use the formattedDate as needed
    },
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'\d+[/]\d+[/]\d+')),
    ],
  ),
),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: TextFormField(
                    controller: _height,
                    autocorrect: true,
                    // initialValue: "Ampa Ignitious",
                    decoration: InputDecoration(
                      hintText: "Height",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                    ),
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
    autocorrect: true,
    // initialValue: "Ampa Ignitious",
    decoration: InputDecoration(
      hintText: "Body Weight",
      border: OutlineInputBorder(
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
                    autocorrect: true,
                    // initialValue: "Ampa Ignitious",
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                    ),
                        validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                  ),
           ),
               SizedBox(height: size.height*0.02,),
       
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(15))
                      )
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
 
              SizedBox(height: size.height*0.02,),
          Container(
                      height: size.height*0.07,
                      width: size.width*0.8,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text("Update user data", style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height*0.023,
                      ),)),
                    ),
                     SizedBox(height: size.height*0.02,),
              SizedBox(height: size.height*0.02,),

                     SizedBox(height: size.height*0.07,),
          ],
        ),
      )
      ,);
  }
}