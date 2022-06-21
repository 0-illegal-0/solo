import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  Rating({Key? key, this.controller, this.width}) : super(key: key);

  int bar = 4;
  final double? width;
  final dynamic controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Customer Review",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(4, (index2) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Checkbox(
                          value: controller.rating[index2],
                          onChanged: (val) {
                            controller.checkStateChange(
                              index2: index2,
                              listItems: controller.rating,
                              id: 0,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  );
                })),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(4, (index) {
                bar = bar - 1;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          controller.checkStateChange(
                              index2: index,
                              listItems: controller.rating,
                              id: 0);
                        },
                        child: Row(
                            children: List.generate(5, (index) {
                          return Icon(Icons.star_rate,
                              size: 20.0,
                              color: index > bar
                                  ? Colors.grey
                                  : const Color(0xFFfc8c03));
                        })),
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                );
              }),
            ),
          ],
        ),
        const Divider(thickness: 2, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
