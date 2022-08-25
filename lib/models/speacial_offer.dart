import 'package:solo/models/categories_models.dart';
import 'add_main_data.dart';
addDataToSpecialOffer() {
  int productIndex =0;
  for (var item in solo!.product) {
    int index = 0;
    for (var item2 in item!.products!) {
      if (item2.specialOffer == true) {
        specialOfferItemDatas.add({
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
}

List specialOfferItemDatas = [];
