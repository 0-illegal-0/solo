import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/cart.dart';
import 'package:solo/view/screens/cart/cart.dart';
import 'package:solo/view/widget/note.dart';

bottomSheet(context, {dynamic sheetWidget, dynamic title}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
            padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
            color: Colors.white,
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    const SizedBox(height: 50),
                    sheetWidget ?? const SizedBox()
                  ],
                )),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: const Color(0xFFe3e3e3),
                ),
                title == null
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                        height: 40,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.clear_outlined,
                          ),
                        ))),
              ],
            ),
          ));
}

class ChargeButton extends StatelessWidget {
  const ChargeButton({Key? key, this.title, this.image, this.price, this.stars, this.width, this.itemIndex, this.productItem, this.itemTitle}) : super(key: key);
  final String? title,image,price,itemTitle;
  final double? width;
  final int? itemIndex, productItem,stars;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xFFeb821a),
      ),
      width: 170,
      child: TextButton(                                                        // print("Product ${specialOfferItemDatas[index]['product-index']}");

          onPressed: () async{
            Cart controller = Get.put(Cart());
            controller.addToCart(context:context,image: image,price: price,stars: stars,
                title: itemTitle,width: width,
                itemIndex: itemIndex,
                productItem: productItem
            );
          },
          child: Text(title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
    );
  }
}

class Delivery extends StatelessWidget {
  const Delivery({Key? key, this.width}) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Text(
              "Delivery: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Order available for delivery in 19 May",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Text(
              "Center: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Available for delivery at any time",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ],
    );
  }
}
