import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:solo/models/cameras_models.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/models/laptop_models.dart';
import 'package:solo/models/mobiles_models.dart';
import 'package:solo/models/television_models.dart';

import '../data.dart';
import 'add_main_data.dart';

getDataToDealsItemsList() {
  for (var item in solo.product) {
    int index = 0;
    for (var item2 in item!.products) {
      if (item2.hotDeal == true) {
        listhotDealsItemsList.add({
          "item": item2,
          "height": item.height,
          "aspectRatio": item.aspectRatio,
          "item-list": item.products,
          "index": index
        });
      }
      index = index + 1;
    }
  }
}

List listhotDealsItemsList = [];
