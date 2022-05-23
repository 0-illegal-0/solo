import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ImageSlider extends GetxController {
  late TabController execute;
  final List? imagesTab;

  ImageSlider({
    this.imagesTab,
    this.product,
  });
  @override
  void onInit() {
    addData();
    super.onInit();
  }

  @override
  void onReady() {
    pri();
    update();
    super.onReady();
  }

  void initStates(This) {
    execute =
        TabController(length: imagesTab!.length, vsync: This, initialIndex: 0);
  }

  List<Widget> imgaes() {
    return List.generate(
        imagesTab!.length,
        (index) => Tab(
              height: 60,
              child: Container(
                width: 35,
                height: 35,
                child: Image.asset(imagesTab![index]),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: index == execute.index ? 3 : 0,
                  ),
                ),
              ),
            ));
  }

  dynamic product;

  List<String> highlightsKeys = [];
  List highlightsValues = [];
  List<String> specificationsKeys = [];
  List specificationsValues = [];

  int k = 0;

  addData() {
    product.informations.forEach((key, value) {
      k = k + 1;
      value.forEach((key, value) {
        if (k == 1) {
          highlightsKeys.add(key);
          highlightsValues.add(value);
        } else {
          specificationsKeys.add(key);
          specificationsValues.add(value);
        }
      });
    });
  }

  pri() {
    execute.addListener(() {
      imgaes();
      update();
    });
  }
}

class MoveSliderData extends GetxController {
  MoveSliderData({
    this.width,
    this.wrapCount,
  });

  double moveUnit = 0;
  int? moveCount = 0, wrapCount;
  double? width;
  //List? itemsList;
  /*int get wrapCount {
    return (itemsList!.length / (6 * 2)).ceil();
  }*/

  moveNext() {
    if (moveCount! < wrapCount! - 1) {
      moveUnit = moveUnit - width!;
      moveCount = moveCount! + 1;
    }
    update();
  }

  moveBack() {
    if (moveCount! > 0) {
      moveUnit = moveUnit + width!;
      moveCount = moveCount! - 1;
    }
    update();
  }
}
