import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/screens/cart/cart.dart';
import 'package:solo/view/screens/login_register/login.dart';

class HeadIcons extends StatelessWidget {
  const HeadIcons(
      {Key? key,
      this.height,
      this.width,
      this.iconSize,
      this.rowWidth,
      this.textIconSize})
      : super(key: key);
  final double? height, width, iconSize, rowWidth, textIconSize;
  Widget iconBar(String? title, IconData? icon, {dynamic page}) {
    return SizedBox(
      height: height,
      width: width,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        tooltip: title,
        onPressed: () {
          Get.to(page, preventDuplicates: false);
          Get.deleteAll();
        },
        icon: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Icon(icon, size: iconSize, color: const Color(0xFFffffff)),
              SizedBox(
                height: 20,
                child: Text(
                  title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textIconSize!,
                      color: const Color(0xFFffffff)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: rowWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconBar("Sign In", Icons.person_outline_outlined,
              page: const Login()),
          iconBar("Help", Icons.help_outline_outlined, page: const Cart()),
          iconBar("Cart", Icons.shopping_cart_outlined, page: const Cart()),
        ],
      ),
    );
  }
}
