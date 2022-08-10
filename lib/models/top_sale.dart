import 'package:solo/models/categories_models.dart';

import '../data.dart';
import 'add_main_data.dart';

List topSale = [];

getDataToTopSale() {
  for (var item in solo!.product) {
    int index = 0;
    for (var item2 in item!.products!) {
      if (item2.topSale == true) {
        topSale.add({
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
