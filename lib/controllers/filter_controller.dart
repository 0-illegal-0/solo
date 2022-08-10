import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/models/categories_models.dart';

class FilterController extends GetxController {
  FilterController({this.width, this.mainItem});
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

  bool priceButtonState = false;
  filter() {
    priceButtonState = true;
    print("soliman");
    update();
  }

  reset() {
    priceButtonState = false;
    update();
  }

  double min = 0;
  double max = 0;
  Map<dynamic, dynamic> priceFilterValues = {"min": 0, "max": 0};
  addValues({int? id, double? priceValue}) {
    if (id == 1) {
      priceFilterValues["min"] = priceValue!;
    } else {
      priceFilterValues["max"] = priceValue!;
    }
    print("----- $priceFilterValues");
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

  List? mainItem;
  List afterfilter = [];
  List itemResult = [];
  List targetItem = [];
  List dataList = [];
  int click = 0;
  int trickt = 0;
  List filterCompare({dynamic data}) {
    return [
      data.price,
      data.stars,
      data.brandName,
      data.cameraResolution,
      data.displaySize,
      data.cpu,
      data.hardSize,
      data.memorySizes,
      data.betteryLife,
      data.graphicsMemory,
      data.displayResolution,
      data.graphicsChipsetBrand,
      data.color
    ];
  }

  addFilterValues() {
    productPageFilterItems(solo.product[1]).forEach((element) {
      dataList.add({"title": element["title"], "value": []});
    });
  }

  filterResult({String? filterTitle, dynamic filterValue, bool? checkVal}) {
    afterfilter = [];
    itemResult = [];
    if (checkVal == true) {
      click = click + 1;
    } else {
      click = click - 1;
    }
    for (var item in dataList) {
      if (item["title"] == filterTitle && checkVal == true) {
        item["value"].add(filterValue);
      } else {
        item["value"].remove(filterValue);
      }
    }
    int key = 0;
    for (var item in dataList) {
      for (var item2 in item["value"]) {
        if (afterfilter.isEmpty) {
          targetItem = mainItem!;
        } else {
          targetItem = afterfilter;
        }
        if (trickt == 0) {
          itemResult = [];
        }

        for (var item3 in targetItem) {
          if (key == 0) {
            if (double.parse(filterCompare(data: item3)[key]) * 1000 >=
                    item2["min"] &&
                double.parse(filterCompare(data: item3)[key]) * 1000 <=
                    item2["max"]) {
              itemResult.add(item3);
            }
          } else if (item2.runtimeType == String) {
            if (filterCompare(data: item3)[key] == item2) {
              itemResult.add(item3);
            }
          } else if (item2.runtimeType == int) {
            if (item3.stars == 6 - item2) {
              itemResult.add(item3);
            }
          } else {
            if (filterCompare(data: item3)[key] >= item2["min"] &&
                filterCompare(data: item3)[key] < item2["max"]) {
              itemResult.add(item3);
            }
          }
        }
        trickt = trickt + 1;

        if (item["value"].length == trickt) {
          afterfilter = itemResult;
          trickt = 0;
        }
      }
      key = key + 1;
    }
  }

  @override
  void onInit() {
    hiddenFilterWidth = -width!;
    addFilterValues();
    super.onInit();
  }
}
