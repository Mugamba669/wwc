import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wwc/helpers/helpers.dart';
import '../Routes/Routes.dart';
import '/Authentication/LoginScreen.dart';

import '../Authentication/EditUserForm.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
  body: Column(children: [
    SizedBox(height: size.height*0.018,),
   Center(child: Text("Settings", style: TextStyle(fontSize: size.height*0.028, color: Colors.black.withOpacity(0.35)),)),
   SizedBox(height: size.height*0.022,),
   InkWell(
    onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
        return EditUserForm();
      }));

    },
     child: Container(
     height: size.height * 0.078,
     width: size.width * 0.95,
     decoration: BoxDecoration(
      color: Colors.blue,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
     ),
     child: Row(
      children: [
        SizedBox(
          width: size.width*0.07,
        ),
        Icon(Icons.person, color: Colors.white,),
              SizedBox(
          width: size.width*0.07,
        ),
        Center(child: Text("Account Settings", style: TextStyle(color: Colors.white),)),
      ],
     ),
   ),
   ),
   SizedBox(height: size.height*0.022,),
   Container(
   height: size.height * 0.078,
   width: size.width * 0.95,
   decoration: BoxDecoration(
    color: Colors.blue,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
   ),
   child: Row(
    children: [
      SizedBox(
        width: size.width*0.07,
      ),
      Icon(Icons.device_hub, color: Colors.white,),
            SizedBox(
        width: size.width*0.07,
      ),
      Center(child: Text("Device Management", style: TextStyle(color: Colors.white),)),
    ],
   ),
   ),
   SizedBox(height: size.height*0.022,),
  //  container having the logout
   InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LoginScreen();
      }));
    },
     child: InkWell(
      onTap: (){
        SharedPreferences.getInstance().then((value) {
          showProgress(context,text: "Logging Out",);
          value.clear().then((value){
            showMessage(context: context,msg: "Logged Out",type: "success");
            Navigator.of(context).pushReplacementNamed(Routes.login);
          });
        });
      },
       child: Container(
       height: size.height * 0.078,
       width: size.width * 0.95,
       decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
       ),
       child: Row(
        children: [
          SizedBox(
            width: size.width*0.07,
          ),
          Icon(Icons.logout, color: Colors.white,),
                SizedBox(
            width: size.width*0.07,
          ),
          Center(child: Text("Logout", style: TextStyle(color: Colors.white),)),
        ],
       ),
        ),
     ),

   ),
  ]),
    );
  }
}