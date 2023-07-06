import 'package:flutter/material.dart';

class SleepingAdvisoryWidgetPage extends StatefulWidget {
  const SleepingAdvisoryWidgetPage({super.key});

  @override
  State<SleepingAdvisoryWidgetPage> createState() => _SleepingAdvisoryWidgetPageState();
}

class _SleepingAdvisoryWidgetPageState extends State<SleepingAdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height*0.035,),
        Text("Sleeping Pattern:--", style: TextStyle(fontSize: size.height*0.035),),
          SizedBox(height: size.height*0.040,),
        Container(
          height: size.height*0.06,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Color.fromARGB(188, 238, 123, 161)
          ),
          child: Center(child: Text("Customized Advisory", style: TextStyle(fontSize: size.height*0.027),)),
        ),
        SizedBox(height: size.height*0.035,),
        Text("Sleeping in progress.")
        // GraphDisplayTabViewWidget()
      ],
    );
  }
}