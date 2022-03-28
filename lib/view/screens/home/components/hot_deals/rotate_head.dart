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
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: 35,
        decoration: BoxDecoration(
          gradient: controller.grade,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* AnimatedRotation(
              turns: controller.val,
              duration: const Duration(seconds: 4),
              onEnd: () {
                controller.val = 0;
              },
              child: Container(
                width: 20,
                height: 20,
                color: const Color(0xFFbd0845),
              ),
            ),*/
            Text(
              title!,
              style: const TextStyle(color: Color(0xFFffffff), fontSize: 22),
            ),
            Text(controller.stopWatch),
            AnimatedRotation(
              turns: -controller.val,
              duration: const Duration(seconds: 4),
              onEnd: () {
                controller.val = 0;
              },
              child: Container(
                width: 20,
                height: 20,
                color: const Color(0xFFbd0845),
              ),
            ),
          ],
        ),
      );
    });
  }
}
