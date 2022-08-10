import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotateHeadController extends GetxController {
  double val = 0;
  Color style = Colors.black;
  RotateHeadController(
      {required this.targetTimeYear,
      required this.targetTimeDayes,
      required this.targetTimeHours,
      required this.targetTimeMonth});

  Color backgroundColor = const Color(0xFFf5c842);

  rotateBox() {
    val = pi;
    update();
  }

  resetRotateBox() {
    val = 0;
    update();
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

  final int targetTimeYear, targetTimeDayes, targetTimeMonth, targetTimeHours;
  DateTime date = DateTime.now();
  DateTime timeNow = DateTime.now();
  DateTime get targetTime {
    return DateTime(
        targetTimeYear, targetTimeMonth, targetTimeDayes, targetTimeHours);
  }

  String stopWatch = "Loading";

  fun() {
    Future.delayed(const Duration(milliseconds: 900), () async {
      await dateNow();
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
      return (maxHour - DateTime.now().hour) + targetTime.hour;
    }
  }

  get days {
    int maxDays = 30;
    return (maxDays - DateTime.now().day) + targetTime.day;
  }

  dateNow() {
    date = DateTime.now();
    stopWatch = "$days:$hour:$minute:$second";
    update();
  }

  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  dateNow2() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  @override
  onReady() {
    call();
    fun();
    changeColor();
  }
}
