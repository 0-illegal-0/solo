import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/models/hot_deals_models.dart';
import 'package:solo/models/most_liked_items_models.dart';
import 'package:solo/models/recommended_models.dart';
import 'package:solo/models/speacial_offer.dart';
import 'package:solo/models/top_sale.dart';
import 'package:solo/view/responsive.dart';

class AllData {
  AllData({this.context}) {
    init();
  }
  final BuildContext? context;
  double? width, height, mainPadding, verticalSpace;
  void init() {
    width = MediaQuery.of(context!).size.width;
    height = MediaQuery.of(context!).size.height;
    mainPadding = width! / 24;
    verticalSpace = width! / 15 > 80 ? 80 : width! / 15;
    getDevice(width);
    addMainData();
    addDataToSpecialOffer();
    getDataToDealsItemsList();
    getDataToRecomendedList();
    getDataToMostLikedItems();
    getDataToTopSale();
  }
}
