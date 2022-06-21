import 'package:solo/models/categories_models.dart';

getData() {
  for (var item in topCategories) {
    int index = 0;
    for (var item2 in item.classModel!) {
      if (item2.specialOffer == true) {
        specialOfferItemDatas.add({
          "item": item2,
          "height": item.height,
          "aspectRatio": item.aspectRatio,
          "imageSize": item.name == "Television" ? "large" : "medium",
          "item-list": item.classModel,
          "index": index
        });
      }
      index = index + 1;
    }
  }
}

List specialOfferItemDatas = [];
