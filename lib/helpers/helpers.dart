// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
showAlertMsg(BuildContext context, {String content = "", String title = ""}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          content: Text(
            content,
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        );
      });
}

/// show progress widget
void showProgress(BuildContext context, {String? text = 'Task'}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Card(
        child: SizedBox(
          height: 90,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SpinKitDualRing(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Theme.of(context).primaryColor),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                "$text..",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void showMessage(
    {String type = 'info',
    String? msg,
    bool float = false,
    required BuildContext context,
    double opacity = 1,
    int duration = 5,
    Animation<double>? animation}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: float ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      content: Text(
        msg ?? '',
        style: const TextStyle(fontSize: 17),
      ),
      backgroundColor: type == 'info'
          ? Colors.lightBlue
          : type == 'warning'
              ? Colors.orange[400]!.withOpacity(opacity)
              : type == 'danger'
                  ? Colors.red[400]!.withOpacity(opacity)
                  : type == 'success'
                      ? const Color.fromARGB(255, 2, 104, 7)
                          .withOpacity(opacity)
                      : Colors.grey[500]!.withOpacity(opacity),
      duration: Duration(seconds: duration),
    ),
  );
}

Future<DateTime?> showDate(BuildContext context) async {
  DateTime? date = await showDatePicker(
    context: context,
    currentDate: DateTime.now(),
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2060),
  );
  return date;
}



// function to return advisory messages based on temperature
String getTemperatureAdvisory(double temperature) {
  if (temperature < 36.1) {
    return "Your body temperature is below the normal body temperature range. You may be experiencing hypothermia. Please consult a healthcare professional.";
  } else if (temperature >= 36.1 && temperature <= 37.2) {
    return "Your body temperature is within the normal range.";
     
  } else {
    return "It's above the normal body temperature range. You may have a fever. Monitor your symptoms and seek medical advice if necessary.";
  }
}

// function to handle date
String formatDateTime(DateTime date) {
  return DateFormat('dd-MM-yyyy hh:mm a').format(date);
}

int computeHoursSpent(TimeOfDay startTime, TimeOfDay endTime) {
  final startMinutes = startTime.hour * 60 + startTime.minute;
  final endMinutes = endTime.hour * 60 + endTime.minute;

  final minutesSpent = endMinutes - startMinutes;
  final hoursSpent = minutesSpent ~/ 60;

  return hoursSpent;
}
