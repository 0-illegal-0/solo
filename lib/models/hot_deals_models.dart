import 'package:flutter/material.dart';

class HotDealsItemsModels {
  final title;
  final price;
  final color;
  final image;

  HotDealsItemsModels({this.image, this.title, this.price, this.color});
}

List<HotDealsItemsModels> hotDealsItemsList = [
  HotDealsItemsModels(
      color: Colors.green,
      price: "50",
      title: "Lenovo-v15",
      image: "assets/images/laptops/lenovo-v15.png"),
  HotDealsItemsModels(
      color: Colors.blue,
      price: "50",
      title: "reno 6",
      image: "assets/images/mobiles/reno-6-black.png"),
  HotDealsItemsModels(
      color: const Color(0xFFe3be19),
      price: "50",
      title: "Sharp-55-inch-4K",
      image: "assets/images/tv/Sharp-55-inch-4K.png"),
  HotDealsItemsModels(
      color: const Color(0xFF4d248f),
      price: "50",
      title: "Watch",
      image: "assets/images/cameras/nikon-p950y.png"),
  HotDealsItemsModels(
      color: const Color(0xFF11bed1),
      price: "50",
      title: "Watch",
      image: "assets/images/laptops/hp-255-g8.png"),
  HotDealsItemsModels(
      color: const Color(0xFF11bed1),
      price: "50",
      title: "redmi-note-11",
      image: "assets/images/mobiles/xiaomi-redmi-note-11.png"),
];
