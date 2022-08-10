import 'add_main_data.dart';

List recomendedList = [];

getDataToRecomendedList() {
  for (var item in solo!.product) {
    int index = 0;
    for (var item2 in item!.products!) {
      if (item2.recomended == true) {
        recomendedList.add({
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
