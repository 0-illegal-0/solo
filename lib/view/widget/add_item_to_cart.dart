import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/widget/add_to_cart.dart';

class AddItemToCart extends StatelessWidget {
  const AddItemToCart(
      {Key? key, this.width, this.image, this.price, this.title, this.stars})
      : super(key: key);
  final double? width;
  final String? image;
  final String? price;
  final String? title;
  final int? stars;

  @override
  Widget build(BuildContext context) {
    Cart cartInstance = Get.put(Cart());
    return Column(
      children: [
        Item(
            width: width,
            image: image!,
            price: price!,
            stars: stars!,
            title: title!),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 60,
              child: GetBuilder<Cart>(builder: (context) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: const EdgeInsets.only(top: 5, left: 5),
                        constraints:
                            const BoxConstraints(maxHeight: 30, maxWidth: 50),
                        hintText: cartInstance.count.toString(),
                        filled: false,
                        fillColor: Colors.black,
                        enabled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      cartInstance.onClick(1);
                    },
                    icon: const Icon(
                      Icons.expand_less_outlined,
                    )),
                IconButton(
                  onPressed: () {
                    cartInstance.onClick(2);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
