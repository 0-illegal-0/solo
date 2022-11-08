import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotateHeadController extends GetxController {
  double val = 0;
  Color style = Colors.black;
  RotateHeadController(
      {required this.targetTimeDayes,
      required this.targetTimeHours,
      required this.targetTimeMonth});

  Color backgroundColor = const Color(0xFFf5c842);

  rotateBox() {
    val = pi;
  }

  resetRotateBox() {
    val = 0;
  }

  Future call() async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      if (val == 0) {
        rotateBox();
      } else {
        resetRotateBox();
      }
    });
    call();
    update();
  }

  int x = 0;

  changeColor() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      if (x == 0) {
        backgroundColor = const Color(0xFFf5c842);
        x = 1;
      } else {
        backgroundColor = const Color(0xFF9c172d);
        x = 0;
      }
    });
    changeColor();
  }

  final int targetTimeDayes, targetTimeMonth, targetTimeHours;
  DateTime date = DateTime.now();
  DateTime get targetTime {
    return DateTime(targetTimeMonth, targetTimeDayes, targetTimeHours);
  }

  String stopWatch = "Loading";

  fun() {
    Future.delayed(const Duration(milliseconds: 900), () async {
      fun();
    });
  }

  get second {
    int maxSecond = 59;
    return (maxSecond - DateTime.now().second) + targetTime.second;
  }

  get minute {
    int maxMinute = 59;
    return (maxMinute - DateTime.now().minute) + targetTime.minute;
  }

  get hour {
    int maxHour = 23;
    if (targetTime.hour >= DateTime.now().hour) {
      return targetTime.hour - DateTime.now().hour - 1;
    } else {
      return ((maxHour - DateTime.now().hour) + targetTime.hour);
    }
  }

  get days {
    int maxDays = 30;
    return (maxDays - DateTime.now().day) + targetTime.day;
  }

  List<Map<String, dynamic>> get theRemainingTime {
    return [
      {"title": "Day", "date": targetTime.day},
      {"title": "Hour", "date": hour},
      {"title": "Minute", "date": minute},
      {"title": "Second", "date": second}
    ];
  }

  @override
  onReady() {
    call();
    fun();
    changeColor();
  }
}
