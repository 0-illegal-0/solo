import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/advertisement_controller.dart';
import 'package:solo/models/advertisement_models.dart';
import 'package:solo/view/screens/home/components/weeklyGift/slider_style1.dart';

class Advertisement extends StatelessWidget {
  Advertisement({Key? key, this.width, this.title, this.mainPadding})
      : super(key: key);

  final double? width, mainPadding;
  final String? title;
  @override
  int foo = 3;
  Widget build(BuildContext context) {
    Sliders controller = Get.put(Sliders(
        width: width,
        mainPadding: mainPadding,
        offset: 0,
        movementDurationPerMilliseconds: 300,
        repetitionDurationPerSecond: 3,
        contentCount: advertisements.length - 1));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 0)),
        Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF8a9296),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0))
              ],
            ),
            width: Sliders.moveTo!,
            height: width! * 0.22,
            constraints: const BoxConstraints(minHeight: 130),
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: Sliders.move,
                itemCount: advertisements.length,
                itemBuilder: (context, i) {
                  return SlidersStyle1(
                      width:
                          width!); /*AdvertisementContent(
                    i: i,
                  );*/
                })),
        const SizedBox(height: 10),
        SizedBox(
          width: width! / 3.3,
          child: GetBuilder<Sliders>(builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Sliders.stageIcon ?? controller.initValue(),
            );
          }),
        )
      ],
    );
  }
}
