import 'package:flutter/material.dart';
import 'package:solo/models/recommended_models.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: 130,
          child: ListView.builder(
            itemExtent: 290,
            itemCount: recomendedList.length,
            cacheExtent: 10,
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
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                recomendedList[index].image!,
                                width: 110,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              recomendedList[index].title!,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            recomendedList[index].description!,
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
                            recomendedList[index].price!,
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
