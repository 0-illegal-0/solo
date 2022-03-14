import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/rotate_head_controller.dart';

class RotateHead extends StatelessWidget {
  const RotateHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RotateHeadController controller =
        Get.put(RotateHeadController(), permanent: false);
    //controller.slideUpdate();
    controller.call();
    return GetBuilder<RotateHeadController>(builder: (context) {
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: 35,
        decoration: BoxDecoration(
          gradient: controller.grade,
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
                width: 20,
                height: 20,
                color: const Color(0xFFbd0845),
              ),
            ),
            const Text(
              "Hot Deals",
              style: TextStyle(color: Color(0xFFffffff), fontSize: 22),
            ),
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
