import 'package:flutter/cupertino.dart';

class Solo {
  String? projectName;
  List<Product>? product;
  List<String>? imagesGiftDesign;
  List<String>? topBrandImage;
  Map? dealFestival;
  Solo({this.projectName, this.product, this.imagesGiftDesign});

  Solo.fromJson(Map<String, dynamic> json) {
    projectName = json['project-name'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }

    if (json['images-gift-design'] != null) {
      imagesGiftDesign = [];
      json['images-gift-design'].forEach((v) {
        imagesGiftDesign!.add(v);
      });
    }

    if (json['top-brand-image'] != null) {
      topBrandImage = [];
      json['top-brand-image'].forEach((v) {
        topBrandImage!.add(v);
      });
    }

    if (json['deal-festival'] != null) {
      dealFestival = json['deal-festival'];
    }
  }
}

class Product {
  String? productName;
  List? brands;
  String? icon;
  double? aspectRatio;
  double? height;
  List? displaySizes;
  List? cameraSizes;
  List? processors;
  List? hardsize;
  List? memorySize;
  List? batteryLife;
  List? graphicsMemory;
  List? displayResolution;
  List? graphicsChipsetBrand;
  List? rating;
  List? itemsColor;
  List<Products>? products;

  Product(
      {this.productName,
      this.brands,
      this.icon,
      this.aspectRatio,
      this.height,
      this.displaySizes,
      this.cameraSizes,
      this.processors,
      this.hardsize,
      this.memorySize,
      this.batteryLife,
      this.graphicsMemory,
      this.displayResolution,
      this.graphicsChipsetBrand,
      this.rating,
      this.itemsColor,
      this.products});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['product-name'];
    brands = json['brands'];
    icon = json['icon'];
    aspectRatio = json['aspect-ratio'];
    height = json['height'];
    displaySizes = json['display-sizes'];
    cameraSizes = json['camera-sizes'];
    processors = json['processors'];
    hardsize = json['hardsize'];
    memorySize = json['memory-size'];
    batteryLife = json['battery-life'];
    graphicsMemory = json['graphics-memory'];
    displayResolution = json['display-resolution'];
    graphicsChipsetBrand = json['graphics-chipsetBrand'];
    rating = json['rating'];
    itemsColor = json['items-color'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
}

class Products {
  String? description;
  String? image;
  String? title;
  bool? specialOffer;
  String? price;
  String? discount;
  String? oldPrice;
  String? brandName;
  List<String>? images;
  Map? informations;
  List? reviews;
  String? warranty;
  bool? recomended;
  bool? latestItem;
  bool? liked;
  bool? topSale;
  bool? hotDeal;
  String? productBrands;
  int? stars;
  double? cameraResolution,
      cameraSizes,
      hardSize,
      memorySizes,
      displaySize,
      graphicsMemory,
      displayResolution,
      betteryLife;
  String? cpu, graphicsChipsetBrand, color;

  Products(
      {this.description,
      this.image,
      this.title,
      this.stars,
      this.specialOffer,
      this.price,
      this.discount,
      this.oldPrice,
      this.brandName,
      this.images,
      this.informations,
      this.reviews,
      this.warranty,
      this.recomended,
      this.latestItem,
      this.liked,
      this.topSale,
      this.hotDeal,
      this.cameraResolution,
      this.productBrands,
      this.hardSize,
      this.memorySizes,
      this.displaySize,
      this.betteryLife,
      this.graphicsMemory,
      this.displayResolution,
      this.graphicsChipsetBrand,
      this.color,
      this.cpu});

  Products.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    image = json['image'];
    title = json['title'];
    specialOffer = json['special-offer'];
    price = json['price'];
    discount = json['discount'];
    oldPrice = json['old-price'];
    brandName = json['product-brands'];
    images = json['images'].cast<String>();
    informations = json['informations'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews!.add(v);
      });
    }
    warranty = json['warranty'];
    recomended = json['recomended'];
    latestItem = json['latest-item'];
    liked = json['liked'];
    topSale = json['top-sale'];
    stars = json['stars'];
    hotDeal = json['hot-deal'];
    productBrands = json['product-brands'];
    cameraResolution = json['camera-resolution'];
    cameraSizes = json['camera-sizes'];
    cpu = json['cpu'];
    hardSize = json['hardsize'];
    memorySizes = json['memory-sizes'];
    displaySize = json['display-size'];
    betteryLife = json['bettery-life'];
    graphicsMemory = json['graphics-memory'];
    displayResolution = json['display-resolution'];
    graphicsChipsetBrand = json['graphics-chipsetBrand'];
    color = json['color'];
  }
}

/*

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
      this.brands,
      this.graphicsMemory,
      this.displayResolution,
      this.displaySizes,
      this.memorySize});
  final String? name, icon;
  final List? classModel;
  final double? aspectRatio, height;
  final List<String>? brands,
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

List<Product> Products = [
  Product(
    name: "Laptops",
    icon: "assets/images/categories_icons/laptop.jpg",
    aspectRatio: 0.9,
    height: 0.55,
    classModel: laptops,
    brands: ["HP", "DELL", "Lenovo", "Acer", "ASUS"],
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
    brands: ["Aplle", "Samsung", "Hawaii", "Lenovo", "Xiaomi"],
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
      brands: ["Aplle", "Samsung", "Hawaii", "Lenovo", "Xiaomi"],
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
    brands: [
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
      brands: [
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
*/
List productPageFilterItems(category) {
  return [
    {"title": "Price", "items": []},
    {"title": "Rating", "items": category!.rating},
    {"title": "Brands", "items": category!.brands},
    {"title": "Camera Resolution", "items": category!.cameraSizes},
    {"title": "Display Size", "items": category!.displaySizes},
    {"title": "CPU", "items": category!.processors},
    {"title": "Hard Disk", "items": category!.hardsize},
    {"title": "Memory Sizes", "items": category!.memorySize},
    {"title": "Bettery Life", "items": category!.batteryLife},
    {"title": "Graphics Memory", "items": category!.graphicsMemory},
    {"title": "Display Resolution", "items": category!.displayResolution},
    {"title": "Graphics ChipsetBrand", "items": category!.graphicsChipsetBrand},
    {"title": "Color", "items": category.itemsColor},
    //{"title": "Discount", "items": []}
  ];
}
