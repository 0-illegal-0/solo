
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo/view/widget/add_to_cart.dart';


class  Cart extends GetxController {

int count = 0;

onClick(int? id){
  if(id == 1){
    count = count +1;
  }else{
    if(count >= 1){
      count = count -1;
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
   if(share.getInt("itemCount") == null){
     itemsCount = 0;
   }else{
     itemsCount = share.getInt("itemCount")!.toInt();
   }

    for( var i = 0 ; items.length < itemsCount; i++ ) {

      if(share.getStringList("$i") != null) {
        items.add(share.getStringList("$i"));
        itemId.add(i);
      }
      print(" items.length ${items.length}");
      print("itemsCount ${itemsCount}");
    }
    update();
  }

  deletePref({int? id}) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    itemsCount = itemsCount - 1;
    await share.setInt("itemCount", itemsCount);
    await  share.remove("$id");

  await  showItem();
    update();
  }

shared({int? productItem, int?itemIndex}) async {
  SharedPreferences share = await SharedPreferences.getInstance();

  for (var d = 0; d < 999; d++) {
    if (share.getStringList("$d") == null) {
      share.setStringList("$d", ["$productItem", "$itemIndex"]);
      if(share.getInt("itemCount") == null){
        share.setInt("itemCount", d + 1);
      }else{
        share.setInt("itemCount", share.getInt("itemCount")!.toInt() + 1);
      }
      break;
    }
  }
}

clear()async{
  SharedPreferences share = await SharedPreferences.getInstance();
  share.clear();
}

  addToCart({BuildContext? context, double? width,String? image, String? price, String? title, int? stars,int? productItem, int?itemIndex}){

    showDialog(
      barrierColor: Colors.white70,
      barrierDismissible:
      true,
      context: (context!),
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFd4d3d2),
        content:  Item(width: width,image: image!,price: price!, stars: stars!, title: title!),
        titleTextStyle: const TextStyle(color: Colors.green),
        contentTextStyle:
        const TextStyle(color: Colors.black, fontSize: 35),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 100,
                child: GetBuilder<Cart>(
                    builder: (context) {
                      return Column(
                        children: [
                          const SizedBox(height: 23),
                          TextFormField(
                            decoration: InputDecoration(
                              isDense: false,
                              hintText:count.toString(),
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
                    }
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){onClick(1);}, icon: const Icon(
                    Icons.expand_less_outlined,
                  )),            IconButton(onPressed:(){onClick(2);}, icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),)
                ],
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(onPressed:  () async{
                await shared(productItem: productItem,itemIndex: itemIndex);
              }, child: const Text('Add')),
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),

              MaterialButton(
                  onPressed: () async{
                   await clear();
                  },
                  child: const Text('Clear')),

            ],
          ),
        ],
      ),
    );
  }

}

