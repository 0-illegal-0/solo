import 'package:flutter/material.dart';

class UserReview extends StatelessWidget {
  const UserReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "4.7",
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.orange, /* height: 0*/
          ),
        ),
        const Text(
          "(9 rating)",
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => Icon(Icons.star_rate,
                    size: 24.0,
                    color: index > 2 ? Colors.grey : Colors.orange))),
      ],
    );
  }
}
