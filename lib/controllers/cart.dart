
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
int? deletedItemsCount = 0;

  showItem() async {
    items = [];
    SharedPreferences share = await SharedPreferences.getInstance();
   if(share.getInt("itemCount") == null){
     itemsCount = 0;
     print(itemsCount);
   }else{
     itemsCount = share.getInt("itemCount")!.toInt();
     print(itemsCount);
   }
    for( var i = 0 ; items.length < itemsCount; i++ ) {
      if(share.getStringList("$i") != null) {
        items.add(share.getStringList("$i"));
      }
    }
    update();
  }

  deletePref({int? id}) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.setInt("itemCount", itemsCount - 1);
    share.remove("$id");
    update();
  }

shared({int? prductItem, int?itemIndex}) async {
  SharedPreferences share = await SharedPreferences.getInstance();

  print("In share $share");
  for (var d = 0; d < 999; d++) {
    if (share.getStringList("$d") == null) {

      share.setStringList("$d", ["$prductItem", "$itemIndex"]);
      share.setInt("itemCount", d + 1);
      print("...This is item Count...${share.getInt("itemCount")!.toInt()}.....");
      print(".in loop.....$d.....");
      break;
    }
  }
}

  addToCart({BuildContext? context, double? width,String? image, String? price, String? title, int? stars,int? prductItem, int?itemIndex}){
    dynamic getValue;

    Item itemInstance = Item();


    clear() async {
      SharedPreferences share = await SharedPreferences.getInstance();
      print("=====  ======");
      share.clear();   // this will remove 4d key
    }

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
                          SizedBox(height: 23),
                          TextFormField(
                            decoration: InputDecoration(
                              isDense: false,
                              hintText:count.toString(),
                              filled: false,
                              fillColor: Colors.black,
                              enabled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
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
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){onClick(1);}, icon: Icon(
                    Icons.expand_less_outlined,
                  )),            IconButton(onPressed:(){onClick(2);}, icon: Icon(
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
                await shared(prductItem: prductItem,itemIndex: itemIndex);
               // await showItem();
                //Navigator.of(context).pop();
              }, child: const Text('Add')),
              MaterialButton(
                  onPressed: () async{
                   // await showItem();

                    print("+++++++ $items +++++++");
                    // Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              MaterialButton(
                  onPressed: () {
                     clear();
                    print("+++++++ $items +++++++");
                    // Navigator.of(context).pop();
                  },
                  child: const Text('Clear'))
            ],
          ),

        ],
      ),
    );
  }

@override
  void onInit() {
   //showItem();
    super.onInit();
  }

}

