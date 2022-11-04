import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/advertisement_controller.dart';
import '../../../../style.dart';
import 'slider_style1.dart';

class WeeklyGift extends StatelessWidget {
  const WeeklyGift({Key? key, this.width, this.title}) : super(key: key);

  List<Widget> styleWidget({width, index}) {
    return [
      SlidersStyle1(width: width, index: index),
      SlidersStyle1(width: width, index: index),
      SlidersStyle1(width: width, index: index),
    ];
  }

  final double? width;
  final String? title;

  @override
  Widget build(BuildContext context) {
    WeeklyController controller2 = Get.put(WeeklyController(
        width: width,
        offset: 0,
        mainPadding: width! / 24,
        movementDurationPerMilliseconds: 300,
        repetitionDurationPerSecond: 3,
        contentCount: styleWidget(width: width, index: 0).length));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: titleStyle),
        ),
        Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF8a9296),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0))
              ],
            ),
            width: controller2.moveTo!,
            height: width! * 0.26,
            constraints: const BoxConstraints(minHeight: 140),
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: controller2.move,
                itemCount: styleWidget(width: width).length,
                itemBuilder: (context, i) {
                  return styleWidget(width: width, index: i)[i];
                })),
        const SizedBox(height: 10),
        Center(
          child: SizedBox(
            width: 80,
            child: GetBuilder<WeeklyController>(builder: (controller2) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller2.stageIcon ?? controller2.initValue(),
              );
            }),
          ),
        ),
      ],
    );
  }
}
