import 'package:flutter/material.dart';
import 'package:solo/models/cameras_models.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/models/laptop_models.dart';
import 'package:solo/models/mobiles_models.dart';
import 'package:solo/models/television_models.dart';

class HotDealsItemsModels {
  final title;
  final price;
  final color;
  final image;

  HotDealsItemsModels({this.image, this.title, this.price, this.color});
}

List listhotDealsItemsList = [
  {
    "item": laptops[0],
    "height": 0.55,
    "aspectRatio": 0.9,
    "item-list": laptops
  },
  {
    "item": mobiles[1],
    "height": 0.60,
    "aspectRatio": 0.8,
    "item-list": mobiles
  },
  {
    "item": televisions[1],
    "height": 0.50,
    "aspectRatio": 1.2,
    "item-list": televisions
  },
  {
    "item": cameras[2],
    "height": 0.50,
    "aspectRatio": 1.1,
    "item-list": cameras
  },
  {
    "item": laptops[1],
    "height": 0.55,
    "aspectRatio": 0.9,
    "item-list": laptops
  },
  {"item": mobiles[0], "height": 0.60, "aspectRatio": 0.8, "item-list": mobiles}
];
