import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
      final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return  Center(
                child: InkWell(
                  onTap: (){
                      //  _signIn();
                  },
                  child: Container(
                    height: size.height*0.09,
                    width: size.width*0.6,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text("Login", style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height*0.023,
                    ),)),
                  ),
                ),
              );
  }
}