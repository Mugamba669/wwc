import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwc/controllers/StepController.dart';

class WalkingAdvisoryWidgetPage extends StatefulWidget {
  const WalkingAdvisoryWidgetPage({super.key});

  @override
  State<WalkingAdvisoryWidgetPage> createState() => _WalkingAdvisoryWidgetPageState();
}

class _WalkingAdvisoryWidgetPageState extends State<WalkingAdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Consumer<StepController>(
      builder: (context,step,x) {
        return Column(
          children: [
            SizedBox(height: size.height*0.035,),
            Text("Walking steadiness: ${step.target}", style: TextStyle(fontSize: size.height*0.035),),
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
            const Text("Walking in progress.")
            // GraphDisplayTabViewWidget()
          ],
        );
      }
    );
  }
}