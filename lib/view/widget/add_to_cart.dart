import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({Key? key, this.image, this.title, this.price, this.stars, this.width}) : super(key: key);

  final String? image, title, price;
  final int? stars;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width! / 3,
      height: width! / 5 < 200?200:width! / 5,
      decoration: const BoxDecoration(
          color: Color(0xFFd4d3d2),
          borderRadius: BorderRadius.all(
              Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(0
                 /* width! / 45 > 20 ? 20 : width! / 45*/),
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

