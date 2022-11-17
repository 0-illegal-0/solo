import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo/view/widget/add_item_to_cart.dart';
import 'package:solo/view/widget/add_to_cart.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Cart extends GetxController {
  int count = 1;

  onClick(int? id) {
    if (id == 1) {
      count = count + 1;
    } else {
      if (count >= 1) {
        count = count - 1;
      }
    }
    update();
  }

  List items = [];
  int itemsCount = 0;
  List<int> itemId = [];

  showItem() async {
    items = [];
    itemId = [];
    SharedPreferences share = await SharedPreferences.getInstance();
    if (share.getInt("itemCount") == null) {
      itemsCount = 0;
    } else {
      itemsCount = share.getInt("itemCount")!.toInt();
    }

    for (var i = 0; items.length < itemsCount; i++) {
      if (share.getStringList("$i") != null) {
        items.add(share.getStringList("$i"));
        itemId.add(i);
      }
    }
    update();
  }

  deletePref({int? id}) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    itemsCount = itemsCount - 1;
    await share.setInt("itemCount", itemsCount);
    await share.remove("$id");

    await showItem();
    update();
  }

  shared({int? productItem, int? itemIndex}) async {
    SharedPreferences share = await SharedPreferences.getInstance();

    for (var d = 0; d < 999; d++) {
      if (share.getStringList("$d") == null) {
        share.setStringList("$d", ["$productItem", "$itemIndex"]);
        if (share.getInt("itemCount") == null) {
          share.setInt("itemCount", d + 1);
        } else {
          share.setInt("itemCount", share.getInt("itemCount")!.toInt() + 1);
        }
        break;
      }
    }
  }

  addToCart(
      {BuildContext? context,
      double? width,
      String? image,
      String? price,
      String? title,
      int? stars,
      int? productItem,
      int? itemIndex}) {
    AwesomeDialog(
            context: context!,
            dialogType: DialogType.noHeader,
            width: width! < 400 ? 360 : 400,
            buttonsBorderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
            dismissOnTouchOutside: true,
            dismissOnBackKeyPress: true,
            btnOkText: "ADD",
            onDismissCallback: (type) {
              String textSnackBar = "";
              print(type == DismissType.btnOk);
              if (type == DismissType.btnOk) {
                textSnackBar = "The item has been added successfully";

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(textSnackBar),
                  ),
                );
              }
            },
            headerAnimationLoop: false,
            animType: AnimType.topSlide,
            showCloseIcon: true,
            btnCancelOnPress: () {},
            autoDismiss: true,
            btnOkOnPress: () async {
              await shared(productItem: productItem, itemIndex: itemIndex);
            },
            body: AddItemToCart(
                image: image,
                price: price,
                stars: stars,
                title: title,
                width: width))
        .show();
  }
}
