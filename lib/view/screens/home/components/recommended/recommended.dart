import 'package:flutter/material.dart';
import 'package:solo/view/responsive.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key, this.width, this.recomendedList})
      : super(key: key);
  final double? width;
  final List? recomendedList;
  double get itemWidth {
    if (width! < 500) {
      return width!;
    } else {
      return 500;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(width);
    if (device == DeviceType.Desktop) {
      return RecommendedDesktopDesign(
        recomendedList: recomendedList,
        width: width,
        showCountInRow: 3,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Recommended",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFc2c2c2),
                  offset: Offset(0, 0.5),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            height: itemWidth / 2.76,
            child: ListView.builder(
              itemExtent: itemWidth / 1.24,
              itemCount: recomendedList!.length,
              cacheExtent: itemWidth / 36,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFc2c2c2),
                        offset: Offset(0, 0.5),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 110,
                        child: Column(
                          children: [
                            const Spacer(),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 95),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  recomendedList![index].image!,
                                  width: 90,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                recomendedList![index].title!,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              recomendedList![index].description!,
                              style: Theme.of(context).textTheme.bodyText2,
                              maxLines: 4,
                            ),
                            const Spacer(),
                            Row(
                                children: List.generate(
                                    5,
                                    (index) => Icon(Icons.star_rate,
                                        size: 17.0,
                                        color: index > 2
                                            ? Colors.grey
                                            : Colors.cyan))),
                            const Spacer(),
                            Text(
                              recomendedList![index].price!,
                              maxLines: 1,
                              style: const TextStyle(color: Color(0xFF26bd08)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      );
    }
  }
}

class RecommendedDesktopDesign extends StatelessWidget {
  const RecommendedDesktopDesign(
      {Key? key, this.recomendedList, this.width, this.showCountInRow})
      : super(key: key);
  final List? recomendedList;
  final double? width;
  final int? showCountInRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
              recomendedList!.length > 3 ? 2 : 1,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: width! / 55.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(showCountInRow!, (index2) {
                        print(index);
                        return Container(
                          height: 150,
                          width: width! / 3.44,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(left: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFc2c2c2),
                                offset: Offset(0, 0.5),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 110,
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    ConstrainedBox(
                                      constraints:
                                          const BoxConstraints(maxHeight: 95),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          recomendedList![index].image!,
                                          width: 90,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        recomendedList![index].title!,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      recomendedList![index].description!,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      maxLines: 4,
                                    ),
                                    const Spacer(),
                                    Row(
                                        children: List.generate(
                                            5,
                                            (index) => Icon(Icons.star_rate,
                                                size: 17.0,
                                                color: index > 2
                                                    ? Colors.grey
                                                    : Colors.cyan))),
                                    const Spacer(),
                                    Text(
                                      recomendedList![index].price!,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Color(0xFF26bd08)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  )),
        ),
        recomendedList!.length > showCountInRow! * 2
            ? const TextButton(onPressed: null, child: Text("Show All"))
            : const SizedBox()
      ],
    );
  }
}


//index2 + index * 3