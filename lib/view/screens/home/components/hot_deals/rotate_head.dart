import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/rotate_head_controller.dart';

class RotateHead extends StatelessWidget {
  const RotateHead({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    RotateHeadController controller = Get.put(
        RotateHeadController(
            targetTimeDayes: 17,
            targetTimeHours: 5,
            targetTimeMonth: 4,
            targetTimeYear: 2022),
        permanent: false);
    return GetBuilder<RotateHeadController>(builder: (context) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        //height: 35,
        decoration: BoxDecoration(
          color: controller.backgroundColor,
          //gradient: controller.grade,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedRotation(
              turns: controller.val,
              duration: const Duration(seconds: 4),
              onEnd: () {
                controller.val = 0;
              },
              child: Container(
                width: 13,
                height: 13,
                color: const Color(0xFFbd0845),
              ),
            ),
            Text(
              title!,
              style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            AnimatedRotation(
              turns: -controller.val,
              duration: const Duration(seconds: 4),
              onEnd: () {
                controller.val = 0;
              },
              child: Container(
                width: 13,
                height: 13,
                color: const Color(0xFFbd0845),
              ),
            ),
          ],
        ),
      );
    });
  }
}
