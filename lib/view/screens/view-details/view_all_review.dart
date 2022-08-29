import 'package:flutter/material.dart';
import 'package:solo/view/screens/view-details/client_review.dart';
import 'package:solo/view/screens/view-details/user_review.dart';

class ViewAllRieviw extends StatelessWidget {
  const ViewAllRieviw({Key? key, this.reviewsList}) : super(key: key);
  final List? reviewsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          color: const Color(0xFFffffff),
          child: Column(
            children: [
              const UserReview(),
              Column(
                  children: List.generate(
                      reviewsList!.length,
                      (index) => ClientReview(
                            items: reviewsList,
                            reviewIndex: index,
                          )))
            ],
          ),
        )
      ],
    );
  }
}

class ViewRating extends StatelessWidget {
  ViewRating({Key? key}) : super(key: key);
  int starValue = 6;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            starValue = starValue - 1;
            return Column(
              children: [
                Container(
                  width: 30,
                  height: 130,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0),
                  ),
                  child: Container(
                    color: Colors.orange,
                    height: 85,
                  ),
                ),
                Text("Star $starValue")
              ],
            );
          }),
        ));
  }
}
