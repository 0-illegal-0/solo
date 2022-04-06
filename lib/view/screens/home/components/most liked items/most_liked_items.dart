import 'package:flutter/material.dart';
import 'package:solo/models/most_liked_items_models.dart';

class MostLiked extends StatelessWidget {
  const MostLiked({
    Key? key,
    required this.width,
    this.mainPadding,
    this.space,
    this.countItem,
    this.title,
  }) : super(key: key);
  final String? title;
  final double width;
  final double? mainPadding, space;
  final int? countItem;
  double get brandGrid {
    return ((width - (mainPadding! * 2) - (space! * (countItem! - 1))) - 14) /
        countItem!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFba0d47),
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Wrap(
            spacing: space!,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: List.generate(
                mostLikedItems.length,
                (index) => Container(
                    width: brandGrid,
                    color: Color(0xFFba0d47),
                    child: CustomPaint(
                      painter: MostLikedPainter(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: width / 14,
                          ),
                          Image.asset(
                            mostLikedItems[index].image!,
                            //color: Colors.white,
                            width: 100,
                            height: 70,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            mostLikedItems[index].title!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 9, bottom: 5),
                            child: Text(
                              mostLikedItems[index].price!,
                              maxLines: 1,
                              style: const TextStyle(shadows: [
                                BoxShadow(
                                    color: Colors.red,
                                    spreadRadius: 10,
                                    offset: Offset(0, 0),
                                    blurRadius: 10)
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}

class MostLikedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFffffff); // 0xFF26a1d1   0xFFa88f32
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width / 2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
