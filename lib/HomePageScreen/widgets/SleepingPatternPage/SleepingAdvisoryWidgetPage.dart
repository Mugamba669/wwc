import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/HoursController.dart';

class SleepingAdvisoryWidgetPage extends StatefulWidget {
  const SleepingAdvisoryWidgetPage({super.key});

  @override
  State<SleepingAdvisoryWidgetPage> createState() => _SleepingAdvisoryWidgetPageState();
}

class _SleepingAdvisoryWidgetPageState extends State<SleepingAdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Consumer<HoursController>(
      builder: (context,time,x) {
        return Column(
          children: [
            SizedBox(height: size.height*0.035,),
            Text("Hours slept : ${time.hours} hrs", style: TextStyle(fontSize: size.height*0.035),),
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
            // const Text("Sleeping in progress.")

          ],
        );
      }
    );
  }
}