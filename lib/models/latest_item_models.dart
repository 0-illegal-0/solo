import 'package:solo/models/categories_models.dart';

class LatestItem {
  LatestItem({this.image, this.desciption, this.price});
  final String? image, desciption, price;
}

List latestItems = [];

getDataToLatestItems() {
  for (var item in topCategories) {
    int index = 0;
    for (var item2 in item.classModel!) {
      if (item2.latestItem == true) {
        latestItems.add({
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

List<LatestItem> latestItems2 = [
  LatestItem(
      image: "assets/images/laptops/lenovo-v15.png",
      desciption: "Lenovo V15",
      price: "10.210 EGP"),
  LatestItem(
      image: "assets/images/laptops/hp-255-g8.png",
      desciption: "HP 255 G8",
      price: "11.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/reno-6-black.png",
      desciption: "Reno 6",
      price: "6.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/xiaomi-redmi-note-11.png",
      desciption: "Redmi Note 11",
      price: "5.210 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/mobiles/iphone-11.png",
      desciption: "Redmi 11",
      price: "15.100 EGP"),
  LatestItem(
      image: "assets/images/laptops/lenovo-v15.png",
      desciption: "Lenovo V15",
      price: "10.210 EGP"),
  LatestItem(
      image: "assets/images/laptops/lenovo-v15.png",
      desciption: "Lenovo V15",
      price: "10.210 EGP"),
  LatestItem(
      image: "assets/images/laptops/lenovo-v15.png",
      desciption: "Lenovo V15",
      price: "10.210 EGP"),
];
