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
  }) : super(key: key);
  final double? width;
  final double? mainPadding;
  final String? title;
  final List? data;
  double? widthValue = 0.0;

  int get maxItemCount {
    return crossAxisCount * 2;
  }

  int get crossAxisCount {
    if (device == DeviceType.Mobile) {
      widthValue = 3.44;
      return 3;
    } else if (device == DeviceType.Tablet) {
      if (width! < 901) {
        widthValue = 4.67;
        return 4;
      } else {
        widthValue = 5.5;
        return 4;
      }
    } else {
      if (width! < 1200) {
        widthValue = 5.06;
        return 5;
      } else if (width! > 1200) {
        widthValue = 6;
        return 5;
      } else {
        widthValue = 7.4;
        return 6;
      }
    }
  }

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
          width: width,
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
        const SizedBox(height: 15),
        viewAll(data, maxItemCount, width, title: title)
      ],
    );
  }
}
