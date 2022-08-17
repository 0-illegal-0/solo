import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

addToCart({BuildContext? context, double? width,String? image, String? price, String? title, int? stars}){
  dynamic getValue;

  Item itemInstance = Item();


  shared() async {
    SharedPreferences shred = await SharedPreferences.getInstance();

    for (var d = 0; d < 99; d++) {
      print("...........");
      if (shred.getString("$d") == null) {
        //getValue = shred.getString("4d");
        //print(getValue);
        shred.setString("$d", "SOLIMAN");
        print("$d");
        break;
      }
    }
  }
  get() async {
    // if u don't use this there will be error
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences shred = await SharedPreferences.getInstance();
    for( var i = 0 ; i < 99; i++ ) {
      if(shred.getString("$i") != null){
        getValue = shred.getString("$i");
        print("... $i ...");
        print("Content:- $getValue");
      }else{
        break;
      }
    }
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
      const TextStyle(color: Colors.blue, fontSize: 35),
      actions: [
        MaterialButton(onPressed:  () {
          shared();
  //Navigator.of(context).pop();
  }, child: const Text('Add')),
  MaterialButton(onPressed:  () {
    get();
  //Navigator.of(context).pop();
  }, child: const Text('Get')),
        MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
      ],
    ),
  );
}




class Item extends StatelessWidget {
  const Item({Key? key, this.image, this.title, this.price, this.stars, this.width}) : super(key: key);

  final String? image, title, price;
  final int? stars;
  final double? width;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

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
