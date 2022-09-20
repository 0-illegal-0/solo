import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/weekly_gift_controller.dart';

import '../../../../style.dart';
import 'slider_style1.dart';
import 'slider_style2.dart';
import 'slider_style3.dart';

class WeeklyGift extends StatelessWidget {
  const WeeklyGift({Key? key, this.width, this.title}) : super(key: key);

  List<Widget> styleWidget({width, index}) {
    return [
      SlidersStyle1(width: width, index: index),
      SlidersStyle2(width: width, index: index),
      SlidersStyle3(width: width, index: index),
    ];
  }

  final double? width;
  final String? title;

  @override
  Widget build(BuildContext context) {
    SlidersPage controller = Get.put(SlidersPage(
        width: width,
        offset: 0,
        movementDurationPerMilliseconds: 400,
        repetitionDurationPerSecond: 3,
        contentCount: 3));
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
            width: SlidersPage.moveTo!,
            height: width! * 0.26,
            constraints: const BoxConstraints(minHeight: 140),
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: SlidersPage.move2,
                itemCount: styleWidget(width: width).length,
                itemBuilder: (context, i) {
                  return styleWidget(width: width, index: i)[i];
                })),
        const SizedBox(height: 10),
        Center(
          child: SizedBox(
            width: 80,
            child: GetBuilder<SlidersPage>(builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: SlidersPage.stageIcon ?? controller.initValue(),
              );
            }),
          ),
        ),
      ],
    );
  }
}
