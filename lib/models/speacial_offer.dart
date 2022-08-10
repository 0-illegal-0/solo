import 'package:solo/models/categories_models.dart';
import 'add_main_data.dart';

addDataToSpecialOffer() {
  for (var item in solo!.product) {
    int index = 0;
    for (var item2 in item!.products!) {
      if (item2.specialOffer == true) {
        specialOfferItemDatas.add({
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

List specialOfferItemDatas = [];
