import 'package:flutter/material.dart';

class Mobiles extends StatelessWidget {
  const Mobiles({Key? key, this.width}) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text("Mobiles", style: Theme.of(context).textTheme.headline6),
        ),
        SizedBox(
            height: width! * 0.69,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Card(
                    child: AspectRatio(
                      aspectRatio: 0.6,
                      child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    "assets/images/mobiles/oppo2.png",
                                  ),
                                ),
                              ),
                              const Text(
                                "Samsung Galaxy A72, 6.5 inches 32GB/2GB Dual SIM 4G",
                                maxLines: 2,
                                textAlign: TextAlign.center,
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
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text("23.700 EGP"),
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
