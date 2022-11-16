import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/widget/show_item_wrap.dart';

Widget viewAll({data, itemCount, width, aspectRatio, String? title}) {
  return data!.length > itemCount!
      ? TextButton(
          onPressed: () {
            Get.deleteAll();
            Get.toNamed("/show-item-wrap", arguments: {
              "data": data,
              "title": title,
              "aspectRatio": aspectRatio
            });
          },
          child: Text("See All",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width! > 900 ? 22 : 17,
                  fontWeight: FontWeight.bold)),
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                  Size(width! * 0.20 > 160 ? 160 : width! * 0.20, 35)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF2089a1))),
        )
      : const SizedBox();
}
