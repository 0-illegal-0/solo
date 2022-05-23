import 'package:flutter/material.dart';
import 'package:solo/view/responsive.dart';

class TopSale extends StatelessWidget {
  TopSale(
      {Key? key,
      this.width,
      this.mainPadding,
      this.space,
      this.title,
      this.itemCountForTablet,
      this.itemCountForDesktop})
      : super(key: key);
  final double? width, mainPadding, space;
  final String? title;
  final int? itemCountForTablet, itemCountForDesktop;
  double? designHeight, designWidth;

  responsiveSizes() {
    if (width! < 850) {
      designHeight = width! / 2.57 > 160 ? 160 : width! / 2.57;
      designWidth = width;
    } else if (width! < 1300) {
      designHeight = 160;
      designWidth =
          (width! - mainPadding! * 2 - space! * (itemCountForTablet! - 1)) /
              itemCountForTablet!;
    } else {
      designHeight = 160;
      designWidth =
          (width! - mainPadding! * 2 - space! * (itemCountForDesktop! - 1)) /
              itemCountForDesktop!;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(width);
    getDevice(width);
    responsiveSizes();
    print(designWidth);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Wrap(
            spacing: space!,
            runSpacing: space!,
            children: List.generate(
              4,
              (index) => Container(
                decoration:
                    const BoxDecoration(color: Color(0xFFffffff), boxShadow: [
                  BoxShadow(
                      color: Color(0xFFbababa),
                      blurRadius: 7,
                      spreadRadius: 0.5,
                      offset: Offset(0, 0))
                ]),
                width: designWidth!,
                height: designHeight,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, left: 5, top: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/laptops/lenovo-v15.png",
                                        height: designHeight! * 0.50,
                                      ),
                                      const Text(
                                        "Lenovo v-15-IGL",
                                        softWrap: false,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                      const Divider(
                                        height: 0,
                                        color: Colors.grey,
                                        indent: 00,
                                        endIndent: 0,
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      5,
                                      (index) => Icon(Icons.star_rate,
                                          size: 17.0,
                                          color: index > 2
                                              ? Colors.grey
                                              : Colors.green))),
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: const [
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 5, right: 5, left: 5),
                                child: Text(
                                    "Laptop - Intel Celeron N4020 - 4GB RAM - 1TB HDD - Intel UHD Graphics 600 - 15.6-inch HD - DOS - Iron Grey",
                                    maxLines: 5),
                              )),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Divider(
                                height: 0,
                                color: Colors.grey,
                                indent: 00,
                                endIndent: 0,
                                thickness: 1,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  "13.000 EGP",
                                  maxLines: 1,
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
