import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/advertisement_controller.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/screens/product-page/product_page.dart';

class SlidersAdvertise extends StatelessWidget {
  const SlidersAdvertise(
      {Key? key,
      this.width,
      this.title,
      this.mainPadding,
      this.slidersList,
      this.controllerState})
      : super(key: key);

  final double? width, mainPadding;
  final String? title;
  final List? slidersList;
  final int? controllerState;
  @override
  Widget build(BuildContext context) {
    AdvertiseController controller1 = Get.put(AdvertiseController(
        width: width,
        mainPadding: mainPadding,
        offset: 0,
        movementDurationPerMilliseconds: 300,
        repetitionDurationPerSecond: 3,
        contentCount: slidersList!.length));
    WeeklyController controller2 = Get.put(WeeklyController(
        width: width,
        offset: 0,
        mainPadding: width! / 24,
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
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF8a9296),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 0))
              ],
            ),
            width:
                controllerState == 1 ? controller1.moveTo! : controller2.moveTo,
            height: width! * 0.26,
            constraints: const BoxConstraints(minHeight: 130),
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller:
                    controllerState == 1 ? controller1.move : controller2.move,
                itemCount: slidersList!.length,
                itemBuilder: (context, i) {
                  return Container(
                    color: const Color(0xFF1C7CB5),
                    child: InkWell(
                      onTap: () {
                        Get.to(
                            () => ProductPage(
                                  category: solo.product[i],
                                  width: width,
                                  aspectRatio: solo.product[i].aspectRatio,
                                  height: solo.product[i].height,
                                ),
                            preventDuplicates: false);
                        Get.deleteAll();
                      },
                      child: slidersList![i],
                    ),
                  );
                })),
        const SizedBox(height: 10),
        SizedBox(
          width: width! / 15 < 70 ? 70 : width! / 15,
          child: controllerState == 1
              ? GetBuilder<AdvertiseController>(builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller1.stageIcon ?? controller1.initValue(),
                  );
                })
              : GetBuilder<WeeklyController>(builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller2.stageIcon ?? controller2.initValue(),
                  );
                }),
        )
      ],
    );
  }
}
