import 'package:solo/models/cameras_models.dart';
import 'package:solo/models/laptop_models.dart';
import 'package:solo/models/mobiles_models.dart';
import 'package:solo/models/tablet_models.dart';
import 'package:solo/models/television_models.dart';

class Product {
  Product(
      {this.processors,
      this.aspectRatio,
      this.hardsize,
      this.icon,
      this.height,
      this.classModel,
      this.graphicsChipsetBrand,
      this.batteryLife,
      this.cameraSizes,
      this.name,
      this.brandstype,
      this.graphicsMemory,
      this.displayResolution,
      this.displaySizes,
      this.memorySize});
  final String? name, icon;
  final List? classModel;
  final double? aspectRatio, height;
  final List<String>? brandstype,
      displaySizes,
      cameraSizes,
      batteryLife,
      processors,
      hardsize,
      graphicsMemory,
      displayResolution,
      graphicsChipsetBrand,
      memorySize;
}

List<Product> topCategories = [
  Product(
    name: "Laptops",
    icon: "assets/images/categories_icons/laptop.jpg",
    aspectRatio: 0.9,
    height: 0.55,
    classModel: laptops,
    brandstype: ["HP", "DELL", "Lenovo", "Acer", "ASUS"],
    displaySizes: [
      "11 inches & under",
      "12 & above",
      "13 & above",
      "14 & above",
      "15 & above",
      "16 & above",
      "17 & above"
    ],
    cameraSizes: [],
    processors: ["AMD", "Intel", "Qualcomm", "NVIDIA", "VIA"],
    hardsize: [
      "80 GB & above",
      "320 GB & above",
      "500 GB & above",
      "1 TB & above",
      "1.5 TB & above",
      "2 TB & above",
      "3 TB & above",
      "4 TB & above"
    ],
    memorySize: [
      "1 GB & above",
      "4 GB & above",
      "8 GB & above",
      "16 GB & above",
      "32 GB & above"
    ],
    batteryLife: ["4 & above", "7 & above", "9 & above", "11 & above"],
    graphicsMemory: ["1 & above", "3 & above", "5 & above", "7 & above"],
    displayResolution: [
      "1024 x 768 pixel",
      "1280 x 800 pixel",
      "1366 x 768 pixel",
      "1600 x 900 pixel",
      "1920 x 1080 pixel",
      "1920 x 1200 pixel",
      "2256 x 1504 pixel",
      "2560 x 1440 pixel",
      "2560 x 1600 pixel",
      "2880 x 1800 pixel",
      "2880 x 1920 pixel",
      "3072 x 1920 pixel",
      "3840 x 2160 pixel",
      "3840 x 2400 pixel"
    ],
    graphicsChipsetBrand: ["NVIDIA", "ATI Radeon", "Intel", "AMD"],
  ),
  Product(
    name: "Mobiles",
    icon: "assets/images/categories_icons/mobile-icon.png",
    classModel: mobiles,
    aspectRatio: 0.8,
    height: 0.60,
    brandstype: ["Aplle", "Samsung", "Hawaii", "Lenovo", "Xiaomi"],
    displaySizes: [
      "2.5 inch & above",
      "4 inch & above",
      "5 inch & above",
      "5.5 inch & above",
      "6 inch & above"
    ],
    cameraSizes: [
      "2.5 MP & above",
      "3 MP & above",
      "7 MP & above",
      "12 MP & above",
      "20 MP & above"
    ],
    processors: [],
    hardsize: [],
    memorySize: [],
    batteryLife: [],
    graphicsMemory: [],
    displayResolution: [],
    graphicsChipsetBrand: [],
  ),
  Product(
      name: "Tablet",
      icon: "assets/images/categories_icons/tablet.png",
      aspectRatio: 1.1,
      height: 0.50,
      classModel: tablets,
      brandstype: ["Aplle", "Samsung", "Hawaii", "Lenovo", "Xiaomi"],
      displaySizes: [],
      cameraSizes: [],
      processors: [],
      hardsize: [],
      memorySize: [],
      batteryLife: [],
      graphicsMemory: [],
      displayResolution: [],
      graphicsChipsetBrand: []),
  Product(
    name: "Television",
    icon: "assets/images/categories_icons/television.png",
    aspectRatio: 1.2,
    height: 0.50,
    classModel: televisions,
    brandstype: [
      "LG",
      "Sony",
      "Samsung",
      "Sony",
      "Panasonic",
      "Hisense",
      "Philips"
    ],
    displaySizes: [],
    cameraSizes: [],
    processors: [],
    hardsize: [],
    memorySize: [],
    batteryLife: [],
    graphicsMemory: [],
    displayResolution: [],
    graphicsChipsetBrand: [],
  ),
  Product(
      name: "Cameras",
      icon: "assets/images/categories_icons/camera.png",
      aspectRatio: 1.1,
      height: 0.50,
      classModel: cameras,
      brandstype: [
        "Canon",
        "Nikon",
        "Pentax",
        "Sony",
        "Olympus",
        "Fujifilm",
        "GoPro",
        "Leica"
      ],
      displaySizes: [],
      cameraSizes: [
        "10 MP & above",
        "20 MP & above",
        "30 MP & above",
        "35 MP & above",
        "50 MP & above"
      ],
      processors: [
        "10 MP & above",
        "20 MP & above",
        "30 MP & above",
        "35 MP & above",
        "50 MP & above"
      ],
      hardsize: [
        "10 MP & above",
        "20 MP & above",
        "30 MP & above",
        "35 MP & above",
        "50 MP & above"
      ],
      memorySize: [],
      batteryLife: [],
      graphicsMemory: [],
      displayResolution: [],
      graphicsChipsetBrand: []),
];

List productPageFilterItems(category) {
  return [
    {"title": "Brands", "items": category!.brandstype},
    {"title": "Camera Resolution", "items": category!.cameraSizes},
    {"title": "Display Size", "items": category!.displaySizes},
    {"title": "CPU", "items": category!.processors},
    {"title": "Hard Disk", "items": category!.hardsize},
    {"title": "Memory Sizes", "items": category!.memorySize},
    {"title": "Bettery Life", "items": category!.batteryLife},
    {"title": "Graphics Memory", "items": category!.graphicsMemory},
    {"title": "Display Resolution", "items": category!.displayResolution},
    {"title": "Graphics ChipsetBrand", "items": category!.graphicsChipsetBrand},
  ];
}
