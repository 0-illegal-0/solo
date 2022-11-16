import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/advertisement_controller.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/screens/product-page/product_page.dart';

class Advertisement extends StatelessWidget {
  const Advertisement(
      {Key? key, this.width, this.title, this.mainPadding, this.slidersList})
      : super(key: key);

  final double? width, mainPadding;
  final String? title;
  final List? slidersList;
  @override
  Widget build(BuildContext context) {
    AdvertiseController controller = Get.put(AdvertiseController(
        width: width,
        mainPadding: mainPadding,
        offset: 0,
        movementDurationPerMilliseconds: 300,
        repetitionDurationPerSecond: 3,
        contentCount: slidersList!.length));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 0)),
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
            width: controller.moveTo!,
            height: width! * 0.26,
            constraints: const BoxConstraints(minHeight: 130),
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: controller.move,
                itemCount: slidersList!.length,
                itemBuilder: (context, i) {
                  return Container(
                    color: const Color(0xFF1C7CB5),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed("/product-page",
                            arguments: {"index": i, "width": width},
                            preventDuplicates: false);
                      },
                      child: slidersList![i],
                    ),
                  );
                })),
        const SizedBox(height: 10),
        SizedBox(
          width: width! / 15 < 70 ? 70 : width! / 15,
          child: GetBuilder<AdvertiseController>(builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: controller.stageIcon ?? controller.initValue(),
            );
          }),
        )
      ],
    );
  }
}
