import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/screens/product-page/product_page.dart';

import '../../../responsive.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    Key? key,
    this.width,
    this.space,
    this.aspectRatio,
  }) : super(key: key);
  final double? width, space, aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          solo.product.length,
          (index) => Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0))),
                    onPressed: () {
                      Get.to(
                          () => ProductPage(
                                category: solo.product[index],
                                width: width,
                                productItem: index,
                                aspectRatio: solo.product[index].aspectRatio,
                                height: solo.product[index].height,
                              ),
                          preventDuplicates: false);
                      Get.deleteAll();
                    },
                    child: Row(
                      children: [
                        Text(solo.product[index].productName as String,
                            style: TextStyle(
                                color: const Color(0xFFffffff),
                                fontSize: device == DeviceType.Mobile
                                    ? 14.5
                                    : device == DeviceType.Tablet
                                        ? 16
                                        : 19)),
                      ],
                    ),
                  ),
                  SizedBox(width: index == solo.product.length - 1 ? 0 : space)
                ],
              )),
    );
  }
}
