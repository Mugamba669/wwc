import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwc/controllers/TemperatureController.dart';
import 'package:wwc/helpers/helpers.dart';

class TemperatureAdvisoryWidgetPage extends StatefulWidget {
  const TemperatureAdvisoryWidgetPage({super.key});

  @override
  State<TemperatureAdvisoryWidgetPage> createState() =>
      _TemperatureAdvisoryWidgetPageState();
}

class _TemperatureAdvisoryWidgetPageState
    extends State<TemperatureAdvisoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<TemperatureController>(builder: (context, temp, x) {
      return Column(
        children: [
          SizedBox(
            height: size.height * 0.035,
          ),
          Text(
            "Temperature:${temp.temperature} °C",
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
            )),
          ),
          Expanded(
            child: ListView(children: [
              SizedBox(
                height: size.height * 0.035,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "The average body temperature is 98.6 F (37 C). But normal body temperature can range between 97 F (36.1 C) and 99 F (37.2 C) or more. Your body temperature can vary depending on how active you are or the time of day. Generally, older people have lower body temperatures than younger people have.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 17),
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              if (temp.temperature < 36.1)
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text:
                            "Your body temperature is below the normal body temperature range.\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      TextSpan(
                        text: "\nTips.\n",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\nSeek Warmth: Move to a warm and sheltered area to prevent further heat loss.\n',
                      ),
                      TextSpan(
                        text:
                            '\nLayer Clothing: Wear multiple layers of loose-fitting, warm clothing to insulate the body and trap heat close to the skin.\n',
                      ),
                      TextSpan(
                        text:
                            '\nWarm Drinks: Sip on warm fluids like hot water, herbal tea, or warm soup to help raise the body\'s internal temperature.\n',
                      ),
                      TextSpan(
                        text:
                            '\nUse Warm Blankets: Wrap yourself in warm blankets or use a heating blanket to provide external warmth.\n',
                      ),
                      TextSpan(
                        text:
                            '\nHeating Methods: If available, use a space heater or fireplace to warm the room you are in, ensuring proper ventilation and safety precautions.\n',
                      ),
                      TextSpan(
                        text:
                            '\nBody Heat Transfer: If necessary, use body heat transfer techniques such as huddling with others or using a warm compress on the torso or underarms to share body heat.\n',
                      ),
                      TextSpan(
                        text:
                            '\nImmediate Medical Attention: If the low body temperature persists, is severe, or accompanied by symptoms such as confusion, shivering, dizziness, or weakness, seek immediate medical attention.\n',
                      ),
                      TextSpan(
                        text:
                            '\nPreventive Measures: Take preventive measures to avoid low body temperature in the future, such as wearing appropriate clothing for cold weather, staying dry, and avoiding prolonged exposure to cold temperatures.\n',
                      ),
                    ],
                  ),
                )
              else if (temp.temperature >= 36.1 && temp.temperature <= 37.2)
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text:
                            "Your body temperature is within the normal range.\n",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Tips.\n",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      TextSpan(
                        text:
                            '\nStay Hydrated: Drink an adequate amount of water throughout the day to keep your body hydrated. It helps maintain proper body temperature regulation and supports overall health.\n',
                      ),
                      TextSpan(
                        text:
                            '\nBalanced Diet: Consume a nutritious and balanced diet that includes a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats. This provides essential nutrients for optimal body functioning.\n',
                      ),
                      TextSpan(
                        text:
                            '\nRegular Exercise: Engage in regular physical activity to promote cardiovascular health, strengthen muscles, and maintain a healthy weight. Aim for at least 150 minutes of moderate-intensity aerobic exercise or 75 minutes of vigorous-intensity exercise per week.\n',
                      ),
                      TextSpan(
                        text:
                            '\nAdequate Sleep: Prioritize quality sleep to allow your body to rest, recover, and regulate its functions effectively. Most adults need 7-9 hours of sleep per night for optimal health.\n',
                      ),
                      TextSpan(
                        text:
                            '\nStress Management: Practice stress management techniques such as deep breathing, meditation, yoga, or engaging in hobbies and activities that bring you joy and relaxation. Chronic stress can impact overall health, so it\'s important to find healthy ways to manage it.\n',
                      ),
                      TextSpan(
                        text:
                            '\nGood Hygiene Practices: Maintain good hygiene by washing hands frequently, especially before eating or preparing food, and after using the restroom. This helps prevent the spread of infections.\n',
                      ),
                      TextSpan(
                        text:
                            '\nRegular Health Check-ups: Schedule regular check-ups with your healthcare provider to monitor your overall health and discuss any concerns or preventive measures.\n',
                      ),
                      TextSpan(
                        text:
                            'Maintain a Healthy Lifestyle: Avoid smoking, limit alcohol consumption, and minimize exposure to environmental toxins. These factors can impact your overall health and body temperature regulation.\n',
                      ),
                    ],
                  ),
                )
              else
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                      TextSpan(
                          text:
                              "It's above the normal body temperature range. You may have a fever. Monitor your symptoms and seek medical advice if necessary.\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          )),
                      TextSpan(text: "Tips.\n"),
                      TextSpan(
                        text:
                            'Rest and Stay Hydrated: Take ample rest to allow your body to recover. Drink plenty of fluids, such as water, to stay hydrated and prevent dehydration caused by fever.\n',
                      ),
                      TextSpan(
                        text:
                            '\nUse Cooling Measures: Use cool compresses, cold packs, or a damp cloth on the forehead, neck, and armpits to help bring down the body temperature. Avoid using ice directly on the skin.\n',
                      ),
                      TextSpan(
                        text:
                            '\nDress Appropriately: Wear lightweight, breathable clothing to facilitate heat dissipation. Opt for loose-fitting garments that allow air circulation and aid in cooling the body.\n',
                      ),
                      TextSpan(
                        text:
                            '\nTake Lukewarm Baths or Showers: If the fever persists, you can take lukewarm baths or showers to help reduce body temperature. Avoid using very cold water as it may cause shivering and elevate the body temperature further.\n',
                      ),
                      TextSpan(
                        text:
                            '\nMedications as Directed: If recommended by a healthcare professional, take fever-reducing medications, such as acetaminophen or ibuprofen, as directed. Follow the recommended dosage and consult a healthcare professional if you have any concerns or questions.\n',
                      ),
                      TextSpan(
                        text:
                            '\nMonitor Symptoms: Keep track of your symptoms and body temperature regularly. Seek medical attention if the high body temperature persists, is accompanied by severe symptoms, or if you have concerns about your health.\n',
                      ),
                      TextSpan(
                        text:
                            '\nConsult a Healthcare Professional: If the high body temperature persists, worsens, or is accompanied by other concerning symptoms, it\'s essential to consult a healthcare professional for an accurate diagnosis and appropriate treatment.\n',
                      ),
                    ]))
            ]),
          ),
        ],
      );
    });
  }
}
