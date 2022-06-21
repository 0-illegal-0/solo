import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  FilterController({this.width});
  double inia = 50;
  double inia2 = 50;
  double? width;

  friendValue({double? v1, double? v2, int? sliderId}) {
    if (v1 != null && sliderId == 1) {
      inia = v1;
    }
    if (v2 != null && sliderId == 2) {
      inia2 = v2;
    }
    update();
  }

  List values = [];
  List rating = [];
  List itemsColor = [];

  checkboxValues({List? itemProperty}) {
    for (var i = 0; i < itemProperty!.length; i++) {
      values.add(false);
    }
    for (var i = 0; i < 4; i++) {
      rating.add(false);
      itemsColor.add(false);
    }
  }

  checkStateChange({int? index2, List? listItems, dynamic id}) {
    if (listItems![index2! + id as int] == false) {
      listItems[index2 + id as int] = true;
    } else {
      listItems[index2 + id as int] = false;
    }
    update();
  }

  bool discount = false;
  discountValue() {
    if (discount == false) {
      discount = true;
      update();
    } else {
      discount = false;
      update();
    }
    update();
  }

  double filterIconWidth = 100;
  Widget filterWidget = const SizedBox();

  dropFilterMenu(Widget? filterWidgets) {
    filterWidget = filterWidgets!;
    update();
  }

  double? hiddenFilterWidth;
  String? buttonName = "Filter ";
  double sizedBoxFilter = 0, intialValHiddenButton = 0;

  displayFilter({String? categoryName}) {
    if (hiddenFilterWidth == 0) {
      hiddenFilterWidth = -width!;
      intialValHiddenButton = 0;
      buttonName = " Filter ";
      sizedBoxFilter = 0;
      print(sizedBoxFilter);
    } else {
      if (categoryName == "Laptops") {
        hiddenFilterWidth = 0;
        sizedBoxFilter = 3150;
        buttonName = " Colse Filter ";
        intialValHiddenButton = 1;
      } else {
        hiddenFilterWidth = 0;
        sizedBoxFilter = 1800;
        buttonName = " Colse Filter ";
        intialValHiddenButton = 1;
      }
    }

    update();
  }

  @override
  void onInit() {
    hiddenFilterWidth = -width!;
    super.onInit();
  }
}
