import 'package:flutter/material.dart';

class AdvisoryWidgetPage extends StatefulWidget {
  const AdvisoryWidgetPage({super.key});

  @override
  State<AdvisoryWidgetPage> createState() => _AdvisoryWidgetPageState();
}

class _AdvisoryWidgetPageState extends State<AdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height*0.035,),
        Text("Heart: 91bpm", style: TextStyle(fontSize: size.height*0.035),),
          SizedBox(height: size.height*0.040,),
        Container(
          height: size.height*0.06,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Color.fromARGB(188, 238, 123, 161)
          ),
          child: Center(child: Text("Customized Advisory", style: TextStyle(fontSize: size.height*0.027),)),
        ),
        // Text("Your temperature is too low. Please visit a doctor")
      ],
    );
  }
}