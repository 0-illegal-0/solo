import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/view-details/view_details.dart';

class HotDealWrap extends StatelessWidget {
  HotDealWrap({
    Key? key,
    this.mainPadding,
    this.width,
    this.widthValue,
    this.data,
    this.maxItemCount,
  }) : super(key: key) {
    getDevice(width);
  }

  final double? mainPadding;
  final double? width, widthValue;
  final int? maxItemCount;
  final List? data;

  double get gridWidth {
    return width! / widthValue!;
  }

  int itemCount() {
    if (data!.length <= maxItemCount!) {
      return data!.length;
    } else {
      return maxItemCount!;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(data![0]["item"].runtimeType);
    print(data![0]["item-list"].runtimeType);
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
          spacing: mainPadding!,
          runSpacing: mainPadding!,
          children: List.generate(
              itemCount(),
              (index) => InkWell(
                  onTap: () {
                    Get.toNamed('/view-details',
                        arguments: {
                          "width": width,
                          "data-list": data![index]["item-list"],
                          "index": data![index]["index"],
                          "product-index": data![index]["product-index"],
                          "aspect-ratio": data![index]["aspectRatio"],
                          "height": data![index]["height"]
                        },
                        preventDuplicates: false);
                    Get.deleteAll();
                  },
                  child: Column(children: [
                    Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFb1b3b5),
                                blurRadius: 10,
                                spreadRadius: 0.1,
                                offset: Offset(0, 0))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: gridWidth,
                      height: gridWidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(data![index]["item"].image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: gridWidth,
                        child: Text(
                          data![index]["item"].title!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    )
                  ])))),
    );
  }
}
