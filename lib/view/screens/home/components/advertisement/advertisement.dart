import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/advertisement_controller.dart';
import 'package:solo/models/advertisement_models.dart';
import 'package:solo/view/screens/home/components/advertisement/advertisement_content.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({Key? key, this.width, this.title}) : super(key: key);

  final width;
  final title;
  @override
  Widget build(BuildContext context) {
    Sliders controller = Get.put(Sliders(
        width: width,
        offset: 0,
        movementDurationPerMilliseconds: 300,
        repetitionDurationPerSecond: 3,
        contentCount: advertisements.length - 1));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
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
            constraints: const BoxConstraints(
                maxWidth: 1100, maxHeight: 150, minHeight: 110),
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: Sliders.move,
                itemCount: advertisements.length,
                itemBuilder: (context, i) {
                  return AdvertisementContent(
                    i: i,
                  );
                })),
        const SizedBox(height: 10),
        SizedBox(
          width: 180,
          child: GetBuilder<Sliders>(builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Sliders.stageIcon == null
                  ? controller.initValue()
                  : Sliders.stageIcon,
            );
          }),
        )
      ],
    );
  }
}
