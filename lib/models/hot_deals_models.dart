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
      title: "Camera",
      image: "assets/top-category.png"),
  HotDealsItemsModels(
      color: Colors.blue,
      price: "50",
      title: "Phone",
      image: "assets/top-category.png"),
  HotDealsItemsModels(
      color: const Color(0xFFe3be19),
      price: "50",
      title: "Watch",
      image: "assets/top-category.png"),
  HotDealsItemsModels(
      color: const Color(0xFF4d248f),
      price: "50",
      title: "headphone",
      image: "assets/top-category.png"),
  HotDealsItemsModels(
      color: const Color(0xFF11bed1),
      price: "50",
      title: "headphone",
      image: "assets/top-category.png"),
  HotDealsItemsModels(
      color: const Color(0xFF11bed1),
      price: "50",
      title: "headphone",
      image: "assets/top-category.png"),
];
