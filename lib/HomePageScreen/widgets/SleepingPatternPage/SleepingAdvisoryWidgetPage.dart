import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/controllers/HoursController.dart';

class SleepingAdvisoryWidgetPage extends StatefulWidget {
  const SleepingAdvisoryWidgetPage({super.key});

  @override
  State<SleepingAdvisoryWidgetPage> createState() =>
      _SleepingAdvisoryWidgetPageState();
}

class _SleepingAdvisoryWidgetPageState
    extends State<SleepingAdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HoursController>(builder: (context, time, x) {
      return Column(
        children: [
          SizedBox(
            height: size.height * 0.035,
          ),
          Text(
            "Hours slept : ${time.hours} hrs",
            style: TextStyle(fontSize: size.height * 0.035),
          ),
          SizedBox(
            height: size.height * 0.040,
          ),
          Container(
            height: size.height * 0.06,
            width: double.maxFinite,
            decoration:
                const BoxDecoration(color: Color.fromARGB(188, 238, 123, 161)),
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
        if (time.hours < 10)
            Text(
              "Your sleeping hours are lower than 8 hours.",
              style: TextStyle(fontSize: size.height * 0.035),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: SleepTips(),
              ),
            ),
         if (time.hours >= 10)
            Text(
              "Your sleeping hours are higher than 8 hours.",
              style: TextStyle(fontSize: size.height * 0.035),
            ),
       if (time.hours >= 10)
            const Expanded(
              child: SingleChildScrollView(
                child: BetterSleepTips(),
              ),
            ),
        ],
      );
    });
  }
}

class BetterSleepTips extends StatelessWidget {
  const BetterSleepTips({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: '\nBetter Sleep Tips:\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                '\nEstablish a Consistent Sleep Schedule: Set a regular sleep schedule by going to bed and waking up at the same time each day, including weekends. Consistency in your sleep routine helps regulate your body\'s internal clock and promotes better sleep quality.\n',
          ),
          TextSpan(
            text:
                '\nCreate a Sleep-Friendly Environment: Ensure your bedroom is quiet, dark, and at a comfortable temperature. Use earplugs, eye shades, or white noise machines if necessary. Make sure your mattress, pillows, and bedding are comfortable and supportive.\n',
          ),
          TextSpan(
            text:
                '\nPractice Good Sleep Hygiene: Adopt healthy sleep habits, such as avoiding stimulating activities close to bedtime, including the use of electronic devices. Establish a relaxing bedtime routine to signal to your body that it\'s time to wind down.\n',
          ),
          TextSpan(
            text:
                '\nLimit Napping: If you find yourself sleeping longer at night, try to limit daytime napping or avoid it altogether. If you must nap, keep it short (around 20-30 minutes) and avoid napping too close to your bedtime.\n',
          ),
          TextSpan(
            text:
                '\nEngage in Regular Physical Activity: Regular exercise can contribute to better sleep quality. Engage in physical activity during the day, but try to finish exercising at least a few hours before bedtime to allow your body to wind down.\n',
          ),
          TextSpan(
            text:
                '\nMonitor Your Sleep Environment: Ensure your sleeping environment is free from disturbances or interruptions. Address any issues that may be causing disrupted or fragmented sleep, such as noise, uncomfortable bedding, or an uncomfortable sleeping temperature.\n',
          ),
          TextSpan(
            text:
                '\nManage Stress and Relax Before Bed: Practice stress management techniques, such as deep breathing exercises, meditation, or gentle stretching, to relax your mind and body before sleep. Engage in activities that help you unwind and promote relaxation.\n',
          ),
          TextSpan(
            text:
                '\nEvaluate Your Sleep Quality: If you consistently sleep for longer hours but still wake up feeling tired or unrefreshed, it may be worth considering factors such as sleep disorders or underlying health conditions. Consult a healthcare professional for a thorough evaluation and appropriate guidance.\n',
          ),
          TextSpan(
            text:
                '\nMaintain a Healthy Lifestyle: Adopting a healthy lifestyle overall can positively impact your sleep. Maintain a balanced diet, limit caffeine and alcohol intake, and avoid smoking. Ensure you\'re getting regular exposure to natural light during the day and manage your stress levels effectively.\n',
          ),
          TextSpan(
            text:
                '\nConsult a Healthcare Professional: If you have concerns about your sleep duration or quality despite following these tips, it\'s advisable to consult with a healthcare professional or sleep specialist for a comprehensive evaluation and personalized advice.\n',
          ),
        ],
      ),
    );
  }
}

class SleepTips extends StatelessWidget {
  const SleepTips({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
            text: 'Sleep Tips:\n',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          TextSpan(
            text:
                '\nPrioritize Sleep: Make sleep a priority by recognizing its importance for your physical and mental well-being. Aim to allocate enough time for sleep in your daily schedule.\n',
          ),
          TextSpan(
            text:
                '\nEstablish a Consistent Sleep Schedule: Set a regular sleep schedule by going to bed and waking up at the same time each day, including weekends. This helps regulate your body\'s internal clock and promotes better sleep quality.\n',
          ),
          TextSpan(
            text:
                '\nCreate a Relaxing Bedtime Routine: Develop a relaxing routine before bed to signal to your body that it\'s time to wind down. This can include activities such as reading a book, taking a warm bath, practicing relaxation techniques, or listening to calming music.\n',
          ),
          TextSpan(
            text:
                '\nCreate a Sleep-Friendly Environment: Ensure your bedroom is quiet, dark, and at a comfortable temperature. Use earplugs, eye shades, or white noise machines if necessary. Consider investing in a comfortable mattress, pillows, and bedding.\n',
          ),
          TextSpan(
            text:
                '\nLimit Exposure to Electronic Devices: Avoid using electronic devices such as smartphones, tablets, or laptops before bed. The blue light emitted by these devices can interfere with your sleep patterns. Instead, engage in relaxing activities or read a physical book.\n',
          ),
          TextSpan(
            text:
                '\nAvoid Stimulants: Limit or avoid consuming caffeine, nicotine, and alcohol, especially in the hours leading up to bedtime. These substances can disrupt sleep patterns and make it harder to fall asleep.\n',
          ),
          TextSpan(
            text:
                '\nCreate a Relaxing Bedroom Atmosphere: Use soft lighting, calming colors, and pleasant scents in your bedroom to create a peaceful and soothing environment.\n',
          ),
          TextSpan(
            text:
                '\nExercise Regularly: Engage in regular physical activity, but try to finish exercising at least a few hours before bedtime. Regular exercise can help improve sleep quality and duration.\n',
          ),
          TextSpan(
            text:
                '\nManage Stress: Practice stress management techniques, such as deep breathing exercises, meditation, or journaling, to help relax your mind and reduce anxiety that may interfere with sleep.\n',
          ),
          TextSpan(
            text:
                '\nConsult a Healthcare Professional: If you continue to experience difficulty sleeping despite implementing these tips, it may be helpful to consult with a healthcare professional or sleep specialist who can provide further guidance and evaluation.\n',
          ),
        ],
      ),
    );
  }
}
