import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deal_wrap.dart';
import 'package:solo/view/screens/home/components/hot_deals/rotate_head.dart';
import 'package:solo/controllers/rotate_head_controller.dart';

class HotDeals extends StatelessWidget {
  const HotDeals(
      {Key? key,
      this.width,
      this.mainPadding,
      this.maxItemCount,
      this.title,
      this.crossAxisCount})
      : super(key: key);
  final double? width;
  final double? mainPadding;
  final int? maxItemCount, crossAxisCount;
  final String? title;
  @override
  Widget build(BuildContext context) {
    RotateHeadController controller = Get.put(RotateHeadController(
        targetTimeDayes: 17,
        targetTimeHours: 5,
        targetTimeMonth: 4,
        targetTimeYear: 2022));
    return Column(
      children: [
        RotateHead(
          title: title!,
        ),
        GetBuilder<RotateHeadController>(builder: (context) {
          return AnimatedDefaultTextStyle(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(controller.stopWatch),
              ),
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
              duration: const Duration(milliseconds: 500));
        }),
        HotDealWrap(
          width: width,
          mainPadding: mainPadding,
        ),
      ],
    );
  }
}
