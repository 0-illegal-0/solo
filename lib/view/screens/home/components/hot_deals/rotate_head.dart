import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/rotate_head_controller.dart';

import '../../../../responsive.dart';
import '../../../../style.dart';

class RotateHead extends StatelessWidget {
  const RotateHead({Key? key, this.title, this.width}) : super(key: key);
  final String? title;
  final double? width;

  static const TextStyle style =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
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
      return Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: sizesResponsive(
                mobile: width, teblet: 600, desktop: 600, device: device),
            padding: EdgeInsets.symmetric(vertical: width! < 650 ? 3 : 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: controller.backgroundColor,
            ),
            child: Text(
              title!,
              style: titleStyle,
            ),
          ),
          SizedBox(
              height: sizesResponsive(
                  device: device, desktop: 20, teblet: 15, mobile: 7)),
          GetBuilder<RotateHeadController>(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("Hour", style: style),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFbbbcbd), width: 0.5)),
                        child: Text(
                          controller.hour.toString(),
                          style: const TextStyle(fontSize: 20),
                        )),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const Text("Minutes", style: style),
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(controller.minute.toString(),
                            style: const TextStyle(fontSize: 20)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFbbbcbd), width: 0.5))),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    const Text("Secondes", style: style),
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(controller.second.toString(),
                            style: const TextStyle(fontSize: 20)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFbbbcbd), width: 0.5))),
                  ],
                ),
              ],
            );
          }),
        ],
      );
    });
  }
}
