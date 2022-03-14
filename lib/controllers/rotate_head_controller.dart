import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotateHeadController extends GetxController {
  double val = 0;
  LinearGradient grade = const LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xFFffffff),
      Color(0xFF9675c9),
      Color(0xFFffffff),
    ],
  );

  rotateBox() {
    val = pi;
    update();
  }

  resetRotateBox() {
    val = 0;
    update();
  }

  gradiant() {
    grade = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Color(0xFFffffff),
        Color(0xFF9675c9),
        Color(0xFFffffff),
      ],
    );
    update();
  }

  resetGradiant() {
    grade = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Colors.white,
        Color(0xFF19bf19),
        Colors.white,
      ],
    );
    update();
  }

  Future call() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      if (val == 0) {
        rotateBox();
        gradiant();
      } else {
        resetRotateBox();
        resetGradiant();
      }
    });
    call();
    update();
  }
}
