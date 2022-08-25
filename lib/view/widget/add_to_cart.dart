import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo/controllers/cart.dart';
import 'package:get/get.dart';

/*
addToCart({BuildContext? context, double? width,String? image, String? price, String? title, int? stars,int? prductItem, int?itemIndex}){
  dynamic getValue;

  Item itemInstance = Item();
  Cart controller = Get.put(Cart());
  shared() async {
   SharedPreferences share = await SharedPreferences.getInstance();
    for (var d = 0; d < 999; d++) {
      if (controller.share!.getStringList("$d") == null) {
        print("......$d.....");
        controller.share!.setStringList("$d", ["$prductItem", "$itemIndex"]);
        break;
      }
      print(".in loop.....$d.....");
    }
  }

  clear() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    print("=====  ======");
    share.clear();   // this will remove 4d key
  }

List items = [];
  showItem() async {
   // SharedPreferences share = await SharedPreferences.getInstance();
    for( var i = 0 ; i < 999; i++ ) {
      if(controller.share!.getStringList("$i") != null){
        items.add(controller.share!.getStringList("$i"));

      }else{
        break;
      }
    }
    print("this is items ${items}");
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
                            hintText:controller.count.toString(),
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
                IconButton(onPressed: (){controller.onClick(1);}, icon: Icon(
                  Icons.expand_less_outlined,
                )),            IconButton(onPressed:(){controller.onClick(2);}, icon: Icon(
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
             await shared();
  //Navigator.of(context).pop();
  }, child: const Text('Add')),
  MaterialButton(
  onPressed: () async{
   await showItem();
    print("+++++++ $items +++++++");
 // Navigator.of(context).pop();
  },
  child: const Text('Cancel')),
            MaterialButton(
                onPressed: () async{
                  await clear();
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

*/


class Item extends StatelessWidget {
  const Item({Key? key, this.image, this.title, this.price, this.stars, this.width}) : super(key: key);

  final String? image, title, price;
  final int? stars;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width! / 3,
      height: width! / 5,
      decoration: const BoxDecoration(
          color: Color(0xFFd4d3d2),
          borderRadius: BorderRadius.all(
              Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(
                  width! / 45 > 20 ? 20 : width! / 45),
              child: Image.asset(
                  image!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 5),
            child: Text(
              title!,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17,fontWeight:FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                          (index2) =>
                          Icon(Icons.star_rate,
                              size: 17,
                              color: index2 <

                                      stars!
                                  ? Colors.orange
                                  : Colors.grey)))),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "${
                      price!} EGP ",
                  maxLines: 1,
                  style: const TextStyle(fontSize: 17),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

