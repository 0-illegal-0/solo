import 'package:flutter/material.dart';

class ViewItem extends StatelessWidget {
  const ViewItem(
      {Key? key,
      this.width,
      this.height,
      this.itemCount,
      this.aspectRatio,
      this.title,
      required this.itemList})
      : super(key: key);
  final double? width;
  final double? height;
  final int? itemCount;
  final double? aspectRatio;
  final String? title;
  final List itemList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(title!, style: Theme.of(context).textTheme.headline6),
        ),
        SizedBox(
            height: height,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Card(
                    child: AspectRatio(
                      aspectRatio: aspectRatio!,
                      child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    itemList[index].image!,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  itemList[index].desciption!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Row(
                                      children: List.generate(
                                          5,
                                          (index) => Icon(Icons.star_rate,
                                              size: 17.0,
                                              color: index > 2
                                                  ? Colors.grey
                                                  : Colors.cyan)))),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        itemList[index].price!,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                    child: IconButton(
                                      alignment: Alignment.topRight,
                                      padding: const EdgeInsets.only(
                                          right: 3, bottom: 3),
                                      color: Colors.green,
                                      icon: const Icon(
                                          Icons.shopping_cart_outlined),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            print("objec000000t");
                          }),
                    ),
                  );
                })),
      ],
    );
  }
}
