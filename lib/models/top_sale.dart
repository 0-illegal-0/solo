import 'package:solo/models/categories_models.dart';

List topSale = [];

getDataToTopSale() {
  for (var item in topCategories) {
    int index = 0;
    for (var item2 in item.classModel!) {
      if (item2.topSale == true) {
        topSale.add({
          "item": item2,
          "height": item.height,
          "aspectRatio": item.aspectRatio,
          "item-list": item.classModel,
          "index": index
        });
      }
      index = index + 1;
    }
  }
}
