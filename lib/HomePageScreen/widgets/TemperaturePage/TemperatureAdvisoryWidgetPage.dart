import 'package:flutter/material.dart';

class TemperatureAdvisoryWidgetPage extends StatefulWidget {
  const TemperatureAdvisoryWidgetPage({super.key});

  @override
  State<TemperatureAdvisoryWidgetPage> createState() => _TemperatureAdvisoryWidgetPageState();
}

class _TemperatureAdvisoryWidgetPageState extends State<TemperatureAdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height*0.035,),
        Text("Temperature: 23C", style: TextStyle(fontSize: size.height*0.035),),
          SizedBox(height: size.height*0.040,),
        Container(
          height: size.height*0.06,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color.fromARGB(188, 238, 123, 161)
          ),
          child: Center(child: Text("Customized Advisory", style: TextStyle(fontSize: size.height*0.027),)),
        ),
        SizedBox(height: size.height*0.035,),
        const Text("Your temperature is too low. Please visit a doctor")
        // GraphDisplayTabViewWidget()
      ],
    );
  }
}