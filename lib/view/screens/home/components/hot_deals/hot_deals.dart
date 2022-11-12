import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/screens/home/components/hot_deals/hot_deal_wrap.dart';
import 'package:solo/view/screens/home/components/hot_deals/rotate_head.dart';
import 'package:solo/controllers/rotate_head_controller.dart';
import 'package:solo/view/widget/view_all_button.dart';

import '../../../../responsive.dart';

class HotDeals extends StatelessWidget {
  HotDeals({
    Key? key,
    this.width,
    this.mainPadding,
    this.title,
    this.data,
    this.targetTimeDayes,
    this.targetTimeHours,
    this.targetTimeMonth,
    this.aspectRatio,
  }) : super(key: key);
  final double? width, aspectRatio;
  final double? mainPadding;
  final String? title;
  final List? data;
  double? widthValue = 0.0;

  final int? targetTimeDayes, targetTimeHours, targetTimeMonth;

  int get maxItemCount {
    return crossAxisCount * 2;
  }

  int get crossAxisCount {
    if (width! < 901) {
      widthValue = 3.65;
      return 3;
    } else if (width! < 1200) {
      widthValue = 5.06;
      return 4;
    } else {
      if (width! <= 1600) {
        widthValue = 6.67;
        return 5;
      } else {
        widthValue = 8.5;
        return 6;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    RotateHeadController controller = Get.put(RotateHeadController(
      targetTimeDayes: targetTimeDayes!,
      targetTimeHours: targetTimeHours!,
      targetTimeMonth: targetTimeMonth!,
    ));

    return Column(
      children: [
        RotateHead(
          title: title!,
          width: width,
          controller: controller,
        ),
        SizedBox(
            height: sizesResponsive(
                device: device, desktop: 20, teblet: 15, mobile: 10)),
        HotDealWrap(
            width: width,
            mainPadding: width! / 24,
            maxItemCount: maxItemCount,
            data: data,
            widthValue: widthValue),
        SizedBox(height: width! < 450 ? 15 : 25),
        viewAll(
            data: data,
            itemCount: maxItemCount,
            width: width,
            title: title,
            aspectRatio: aspectRatio),
      ],
    );
  }
}
