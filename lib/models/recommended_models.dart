import 'package:solo/models/categories_models.dart';

class RecommendedItem {
  RecommendedItem({this.image, this.title, this.description, this.price});
  final String? image, title, description, price;
}
/*
List<RecommendedItem> recomendedList = [
  RecommendedItem(
      image: "assets/images/cameras/nikonb500-b-1.jpg",
      description:
          "16MP 1/2.3″ BSI CMOS SensorNIKKOR f/3.0-6.5 ED Lens\n22.5-900mm (35mm Equivalent)\n40x Optical Zoom Lens, 80x Dynamic Zoom/n3″ 921k-Dot Tilting LCD",
      title: "Nikon COOLPIX B500",
      price: "5.300 EGP"),
  RecommendedItem(
      image: "assets/images/laptops/Lenovo-V15-igl.jpg",
      description:
          "Laptop - Intel Celeron N4020 - 4GB RAM - 1TB HDD - Intel UHD Graphics 600 - 15.6-inch HD - DOS - Iron Grey",
      title: "Lenovo V15-IGL",
      price: "4.650.00 EGP"),
  RecommendedItem(
      image: "assets/images/laptops/Lenovo-V15-igl.jpg",
      description:
          "Laptop - Intel Celeron N4020 - 4GB RAM - 1TB HDD - Intel UHD Graphics 600 - 15.6-inch HD - DOS - Iron Grey",
      title: "Lenovo V15-IGL",
      price: "4.650.00 EGP"),
  RecommendedItem(
      image: "assets/images/laptops/Lenovo-V15-igl.jpg",
      description:
          "Laptop - Intel Celeron N4020 - 4GB RAM - 1TB HDD - Intel UHD Graphics 600 - 15.6-inch HD - DOS - Iron Grey",
      title: "Lenovo V15-IGL",
      price: "4.650.00 EGP"),
  RecommendedItem(
      image: "assets/images/laptops/Lenovo-V15-igl.jpg",
      description:
          "Laptop - Intel Celeron N4020 - 4GB RAM - 1TB HDD - Intel UHD Graphics 600 - 15.6-inch HD - DOS - Iron Grey",
      title: "Lenovo V15-IGL",
      price: "4.650.00 EGP"),
  RecommendedItem(
      image: "assets/images/laptops/Lenovo-V15-igl.jpg",
      description:
          "Laptop - Intel Celeron N4020 - 4GB RAM - 1TB HDD - Intel UHD Graphics 600 - 15.6-inch HD - DOS - Iron Grey",
      title: "Lenovo V15-IGL",
      price: "4.650.00 EGP"),
  RecommendedItem(
      image: "assets/images/laptops/Lenovo-V15-igl.jpg",
      description:
          "Laptop - Intel Celeron N4020 - 4GB RAM - 1TB HDD - Intel UHD Graphics 600 - 15.6-inch HD - DOS - Iron Grey",
      title: "Lenovo V15-IGL",
      price: "4.650.00 EGP"),
];
*/

List recomendedList = [];

getDataToRecomendedList() {
  for (var item in topCategories) {
    int index = 0;
    for (var item2 in item.classModel!) {
      if (item2.recomended == true) {
        // recomendedList.add(item2);
        recomendedList.add({
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
