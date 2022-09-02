import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/screens/cart/cart.dart';
import 'package:solo/view/screens/login_register/login.dart';

class HeadIcons extends StatelessWidget {
  const HeadIcons(
      {Key? key,
      this.height,
      this.width,
      this.iconSize,
      this.rowWidth,
      this.textIconSize, this.controller})
      : super(key: key);
  final Cart? controller;
  final double? height, width, iconSize, rowWidth, textIconSize;
  Widget iconBar(String? title, IconData? icon, {Widget? page, dynamic pageState}) {
    return SizedBox(
      height: height,
      width: width,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        tooltip: title,
        onPressed: () async{
          if(pageState == "CART"){
            Cart controller = Get.put(Cart());
            await  controller.showItem();
           Get.to( page);
          }else{
            print("pageState is Null");
          }
          print("$page ....");
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
   Cart controller = Get.put(Cart());
    return SizedBox(
      width: rowWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconBar("Sign In", Icons.person_outline_outlined,
              page: const Login()),
          iconBar("Help", Icons.help_outline_outlined, page:  CartBudget()),
          iconBar("Cart", Icons.shopping_cart_outlined, page:  CartBudget(/*controller: controller*/),pageState: "CART"),
        ],
      ),
    );
  }
}
