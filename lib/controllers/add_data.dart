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
Map itemData = {"special-offer":[],"hot-deal":[],"latest-item":[],"liked":[], "recomended":[],"top-sale":[],};
  List getItemData({dynamic data}) {
    return [
      {"method":data.specialOffer,"item":"special-offer"},
      {"method":data.hotDeal,"item":"hot-deal"},
      {"method":data.latestItem,"item":"latest-item"},
      {"method":data.liked,"item":"liked"},
      {"method":data.recomended,"item":"recomended"},
      {"method":data.topSale,"item":"top-sale"},
    ];
  }
  int dataIndex = 0;
  getItem() {
    itemData.forEach((key, value) {
      int productIndex =0;
      for (var item in solo!.product) {
        int index = 0;
        for (var item2 in item!.products!) {
          if (getItemData(data: item2)[dataIndex]['method'] == true) {
             itemData[key!].add({
              "item": item2,
              "height": item.height,
              "aspectRatio": item.aspectRatio,
              "item-list": item.products,
              "index": index,
              "product-index":productIndex
            });
          }
          index = index + 1;
        }
        productIndex = productIndex +1;
      }
      dataIndex = dataIndex +1;
    });
  }

  void init() {
    width = MediaQuery.of(context!).size.width;
    height = MediaQuery.of(context!).size.height;
    mainPadding = width! / 24;
    verticalSpace = width! / 15 > 80 ? 80 : width! / 15;
    getDevice(width);
    addMainData();
   /* addDataToSpecialOffer();
    getDataToDealsItemsList();
    getDataToRecomendedList();
    getDataToMostLikedItems();
    getDataToTopSale();*/
    getItem();
  }
}
