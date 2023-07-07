import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwc/controllers/StepController.dart';

class WalkingAdvisoryWidgetPage extends StatefulWidget {
  const WalkingAdvisoryWidgetPage({super.key});

  @override
  State<WalkingAdvisoryWidgetPage> createState() =>
      _WalkingAdvisoryWidgetPageState();
}

class _WalkingAdvisoryWidgetPageState extends State<WalkingAdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<StepController>(
      builder: (context, step, x) {
        return Column(
          children: [
            SizedBox(
              height: size.height * 0.035,
            ),
            Text(
              "Steps: ${step.target}",
              style: TextStyle(fontSize: size.height * 0.035),
            ),
            SizedBox(
              height: size.height * 0.040,
            ),
            Container(
              height: size.height * 0.06,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(188, 238, 123, 161)),
              child: Center(
                child: Text(
                  "Customized Advisory",
                  style: TextStyle(fontSize: size.height * 0.027),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    "1000 steps per day is reasonable target for adults.",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  if (step.target < 1000)
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "\nBelow the target\n",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "\nTips:\n",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text:
                                '\nYou are below your daily step target. Try to incorporate more physical activity into your day to reach the goal of 1000 steps.\n',
                          ),
                          TextSpan(
                            text:
                                '\nKeep in mind that regular movement is important for your overall well-being. Try taking short walks or finding opportunities for physical activity throughout the day.\n',
                          ),
                          TextSpan(
                            text:
                                '\nConsider taking the stairs instead of the elevator or going for a short walk during breaks to increase your daily step count.\n',
                          ),
                        ],
                      ),
                    ),
                  if (step.target == 1000)
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "\nReached the Target.\n,",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "\nTips:\n",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nCongratulations on reaching your daily step target of 1000 steps! Regular physical activity is beneficial for your health and well-being.\n',
                          ),
                          TextSpan(
                            text:
                                '\nGreat job on meeting your goal! Remember to maintain an active lifestyle and continue to prioritize physical activity for long-term health benefits.\n',
                          ),
                          TextSpan(
                            text:
                                '\nMeeting your daily step target is a positive step towards a healthier lifestyle. Keep up the good work.\n',
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
