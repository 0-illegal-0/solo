import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/rotate_head_controller.dart';
import '../../../../responsive.dart';
import '../../../../style.dart';

class RotateHead extends StatelessWidget {
  const RotateHead({Key? key, this.title, this.width, this.controller})
      : super(key: key);
  final String? title;
  final double? width;
  final RotateHeadController? controller;

  @override
  Widget build(BuildContext context) {
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
              color: controller!.backgroundColor,
            ),
            child: Text(
              title!,
              style: titleStyle,
            ),
          ),
          SizedBox(
              height: sizesResponsive(
                  device: device, desktop: 20, teblet: 15, mobile: 7)),
          Row(
              mainAxisAlignment: device == DeviceType.Mobile
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: List.generate(
                  controller!.theRemainingTime.length,
                  (index) => DatEvent(
                      controller: controller, index: index, width: width)))
        ],
      );
    });
  }
}

class DatEvent extends StatelessWidget {
  const DatEvent({Key? key, this.index, this.controller, this.width})
      : super(key: key);

  final int? index;
  final double? width;
  final RotateHeadController? controller;

  @override
  Widget build(BuildContext context) {
    return device == DeviceType.Mobile
        ? Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${controller!.theRemainingTime[index!]["title"]}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: device == DeviceType.Mobile ? 15 : 18)),
                  Text(
                    controller!.theRemainingTime[index!]["date"].toString(),
                    style: TextStyle(
                        fontSize: device == DeviceType.Mobile ? 15 : 18),
                  )
                ]))
        : Row(
            children: [
              Text("${controller!.theRemainingTime[index!]["title"]} : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: device == DeviceType.Mobile ? 15 : 18)),
              Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFFbbbcbd), width: 0.5)),
                  child: Text(
                    controller!.theRemainingTime[index!]["date"].toString(),
                    style: TextStyle(
                        fontSize: device == DeviceType.Mobile ? 15 : 18),
                  )),
              SizedBox(width: width! / 24.6)
            ],
          );
  }
}
