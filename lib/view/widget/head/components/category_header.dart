import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/categories_models.dart';
import 'package:solo/view/screens/product-page/product_page.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    Key? key,
    this.width,
    this.space,
    this.aspectRatio,
  }) : super(key: key);
  final double? width, space, aspectRatio;

  Widget categoriesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          topCategories.length,
          (index) => Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0))),
                    onPressed: () {
                      Get.to(
                          () => ProductPage(
                                category: topCategories[index],
                                width: width,
                                aspectRatio: topCategories[index].aspectRatio,
                                height: topCategories[index].height,
                              ),
                          preventDuplicates: false);
                      Get.deleteAll();
                    },
                    child: Row(
                      children: [
                        Text(topCategories[index].name as String,
                            style: const TextStyle(
                                color: Color(0xFFffffff), fontSize: 16)),
                      ],
                    ),
                  ),
                  SizedBox(width: index == topCategories.length - 1 ? 0 : space)
                ],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: const Color(0xFF13a7bd),
        child: categoriesRow());
  }
}
