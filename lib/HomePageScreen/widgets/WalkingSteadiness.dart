import 'package:flutter/material.dart';

class WalkingSteadiness extends StatefulWidget {
  const WalkingSteadiness({super.key});

  @override
  State<WalkingSteadiness> createState() => _WalkingSteadinessState();
}

class _WalkingSteadinessState extends State<WalkingSteadiness> {
  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Container(
              height: size.height*0.07,
              width: size.width*0.89,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
const Icon(Icons.nordic_walking, color: Colors.white,),
Text("WALKING STEADINESS", style: TextStyle(color: Colors.white, fontSize: size.height*0.03),)
                ],
              ),
            );
  }
}