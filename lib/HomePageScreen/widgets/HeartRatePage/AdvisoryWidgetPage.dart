import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwc/controllers/HeartRateController.dart';

class AdvisoryWidgetPage extends StatefulWidget {
  const AdvisoryWidgetPage({super.key});

  @override
  State<AdvisoryWidgetPage> createState() => _AdvisoryWidgetPageState();
}

class _AdvisoryWidgetPageState extends State<AdvisoryWidgetPage> {
  final List<Map<String, dynamic>> heartRateData = [
    {'age': 20, 'zone': '100 - 170 bpm'},
    {'age': 30, 'zone': '95 - 162 bpm'},
    {'age': 35, 'zone': '93 - 157 bpm'},
    {'age': 40, 'zone': '90 - 153 bpm'},
    {'age': 45, 'zone': '88 - 149 bpm'},
    {'age': 50, 'zone': '85 - 145 bpm'},
    {'age': 55, 'zone': '83 - 140 bpm'},
    {'age': 60, 'zone': '80 - 136 bpm'},
    {'age': 65, 'zone': '78 - 132 bpm'},
    {'age': 70, 'zone': '75 - 128 bpm'},
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HeartRateController>(builder: (context, heart, x) {
      return Column(
        children: [
          SizedBox(
            height: size.height * 0.035,
          ),
          Text(
            "Heart: ${heart.heartRate} bpm",
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
          // DataTable(
          //   columns: const [
          //     DataColumn(label: Text('Age')),
          //     DataColumn(label: Text('Heart Rate Zone')),
          //   ],
          //   rows: heartRateData
          //       .map((data) => DataRow(cells: [
          //             DataCell(Text(data['age'].toString())),
          //             DataCell(Text(data['zone'])),
          //           ]))
          //       .toList(),
          // ),
          Expanded(
            child: ListView(
              children: [
                if (heartRateData.length > 100)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                "Your Heart rate is higher than the normal range\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: "\nTips.\n",
                            style: TextStyle(fontSize: 17),
                          ),
                          TextSpan(
                            text:
                                '\nBalanced Diet: Follow a balanced diet rich in fruits, vegetables, whole grains, lean proteins (such as poultry, fish, beans, and tofu), and healthy fats (such as avocados, nuts, and olive oil). Limit your intake of saturated fats, trans fats, added sugars, and sodium.\n',
                          ),
                          TextSpan(
                            text:
                                '\nOmega-3 Fatty Acids: Include sources of omega-3 fatty acids in your diet, such as fatty fish (salmon, mackerel, sardines), chia seeds, flaxseeds, and walnuts. Omega-3 fatty acids have been associated with heart health benefits.\n',
                          ),
                          TextSpan(
                            text:
                                '\nFiber-Rich Foods: Incorporate fiber-rich foods like whole grains, legumes, fruits, and vegetables into your meals. Fiber can help maintain heart health by reducing cholesterol levels.\n',
                          ),
                          TextSpan(
                            text:
                                '\nAntioxidant-Rich Foods: Include foods high in antioxidants, such as berries, dark leafy greens, tomatoes, and colorful fruits and vegetables. Antioxidants can help protect against oxidative stress and support heart health.\n',
                          ),
                          TextSpan(
                            text:
                                '\nLimit Sodium Intake: Excessive sodium consumption can contribute to high blood pressure. Limit your intake of processed and packaged foods, which often contain high amounts of sodium. Opt for fresh, whole foods and season your meals with herbs and spices instead of salt.\n',
                          ),
                          TextSpan(
                            text:
                                '\nHydration: Stay properly hydrated by drinking adequate amounts of water throughout the day. Water supports overall cardiovascular health.\n',
                          ),
                          TextSpan(
                            text:
                                '\nLimit Caffeine and Stimulants: Some individuals may be sensitive to caffeine and other stimulants, which can increase heart rate. Limit your intake of caffeinated beverages and monitor your body\'s response.\n',
                          ),
                          TextSpan(
                            text:
                                '\nManage Stress: Stress can affect heart rate and overall heart health. Practice stress management techniques like deep breathing exercises, meditation, yoga, or engaging in activities that help you relax and unwind.\n',
                          ),
                          TextSpan(
                            text:
                                '\nRegular Physical Activity: Engage in regular physical activity as recommended by your healthcare professional. Regular exercise can help improve heart health and regulate heart rate. Choose activities you enjoy and can safely perform.\n',
                          ),
                          TextSpan(
                            text:
                                '\nMaintain a Healthy Weight: Aim for a healthy weight range by following a balanced diet and engaging in regular physical activity. Excess weight can put strain on the heart and contribute to heart rate abnormalities.\n',
                          ),
                        ],
                      ),
                    ),
                  )
                else if (heart.heartRate > 60 && heart.heartRate < 100)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Your Heart rate is within the normal range\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          TextSpan(
                            text: "\nTips.\n",
                            style: TextStyle(fontSize: 17),
                          ),
                          TextSpan(
                            text:
                                '\nStay Active: Engage in regular physical activity to keep your heart healthy. Aim for at least 150 minutes of moderate-intensity aerobic exercise or 75 minutes of vigorous-intensity exercise per week. Activities like brisk walking, jogging, swimming, cycling, or dancing are beneficial for cardiovascular fitness.\n',
                          ),
                          TextSpan(
                            text:
                                '\nMaintain a Balanced Diet: Follow a balanced diet that includes a variety of nutrient-dense foods. Include fruits, vegetables, whole grains, lean proteins (such as fish, poultry, beans, and tofu), and healthy fats (such as avocado, nuts, and olive oil). Limit your intake of processed foods, saturated fats, added sugars, and sodium.\n',
                          ),
                          TextSpan(
                            text:
                                '\nConsume Omega-3 Fatty Acids: Include foods rich in omega-3 fatty acids, such as fatty fish (salmon, mackerel, trout), chia seeds, flaxseeds, and walnuts. Omega-3 fatty acids have been associated with heart health and can help maintain a healthy heart rate.\n',
                          ),
                          TextSpan(
                            text:
                                '\nLimit Sodium Intake: Excessive sodium consumption can contribute to high blood pressure, which can affect heart health. Limit your intake of processed and packaged foods, as they often contain high amounts of sodium. Opt for fresh, whole foods and season your meals with herbs and spices instead of salt.\n',
                          ),
                          TextSpan(
                            text:
                                '\nStay Hydrated: Drink an adequate amount of water throughout the day to maintain hydration and support optimal heart function. Aim for at least 8 cups (64 ounces) of water per day, or adjust based on your individual needs and activity level.\n',
                          ),
                          TextSpan(
                            text:
                                '\nManage Stress: Chronic stress can have negative effects on heart health. Practice stress management techniques such as deep breathing exercises, meditation, yoga, or engaging in hobbies and activities that help you relax and unwind.\n',
                          ),
                          TextSpan(
                            text:
                                '\nGet Enough Sleep: Aim for 7-9 hours of quality sleep each night. Sufficient sleep helps regulate your heart rate, blood pressure, and overall cardiovascular health.\n',
                          ),
                          TextSpan(
                            text:
                                '\nLimit Alcohol and Avoid Smoking: Excessive alcohol consumption and smoking can negatively impact heart health. Limit alcohol intake to moderate levels (up to one drink per day for women and up to two drinks per day for men) and avoid smoking altogether.\n',
                          ),
                          TextSpan(
                            text:
                                '\nRegular Health Check-ups: Schedule regular check-ups with your healthcare provider to monitor your heart health, assess risk factors, and discuss any concerns or preventive measures.\n',
                          ),
                        ],
                      ),
                    ),
                  ),
                if (heart.heartRate < 60)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Your Heart rate is below the normal range\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextSpan(
                            text: "\nTips.\n",
                            style: TextStyle(fontSize: 17),
                          ),
                          TextSpan(
                            text:
                                '\nConsult a Healthcare Professional: If you have a consistently low heart rate and experience symptoms such as dizziness, fatigue, shortness of breath, or fainting, it is important to consult a healthcare professional for a thorough evaluation and appropriate guidance.\n',
                          ),
                          TextSpan(
                            text:
                                '\nMonitor Heart Rate: Keep track of your heart rate regularly, especially during physical activity or when experiencing symptoms. Use a heart rate monitor or check your pulse to monitor any changes or irregularities.\n',
                          ),
                          TextSpan(
                            text:
                                '\nHydration: Ensure you stay adequately hydrated by drinking enough water throughout the day. Dehydration can exacerbate symptoms and potentially affect heart rate.\n',
                          ),
                          TextSpan(
                            text:
                                '\nMedication Review: If you are taking any medications that may contribute to a low heart rate, discuss them with your healthcare professional. They can evaluate the necessity and potential alternatives if needed.\n',
                          ),
                          TextSpan(
                            text:
                                '\nExercise and Physical Activity: Engage in regular physical activity as recommended by your healthcare professional. Physical activity can help improve heart health and cardiovascular fitness. However, it\'s essential to consult with your healthcare professional to determine the appropriate level of exercise for your condition.\n',
                          ),
                          TextSpan(
                            text:
                                '\nHealthy Diet: Maintain a balanced diet rich in nutrients to support overall heart health. Include foods high in fiber, lean proteins, fruits, vegetables, and whole grains. Consult a healthcare professional or nutritionist for personalized dietary recommendations.\n',
                          ),
                          TextSpan(
                            text:
                                '\nManage Stress: Stress management techniques such as relaxation exercises, meditation, deep breathing, and engaging in activities you enjoy can help manage stress levels and potentially positively influence heart rate.\n',
                          ),
                          TextSpan(
                            text:
                                '\nRegular Check-ups: Schedule regular check-ups with your healthcare professional to monitor your heart health and discuss any concerns or changes in your condition.\n',
                          ),
                          TextSpan(
                            text:
                                '\nBe Aware of Medications and Supplements: Certain medications, over-the-counter drugs, and herbal supplements may affect heart rate. Discuss with your healthcare professional or pharmacist to ensure they are safe to use with a low heart rate.\n',
                          ),
                          TextSpan(
                            text:
                                '\nFollow Medical Advice: Follow the recommendations and treatment plans provided by your healthcare professional for managing your specific condition and optimizing heart health.\n',
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      );
    });
  }
}
