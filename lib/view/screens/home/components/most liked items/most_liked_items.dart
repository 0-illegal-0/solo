import 'package:flutter/material.dart';
import 'package:solo/models/most_liked_items_models.dart';
import 'package:solo/view/responsive.dart';

class MostLiked extends StatelessWidget {
  const MostLiked({
    Key? key,
    required this.width,
    this.mainPadding,
    this.space,
    this.title,
  }) : super(key: key);
  final String? title;
  final double width;
  final double? mainPadding, space;
  static const double symmetricPadding = 7;

  int get countItem {
    if (device == DeviceType.Mobile) {
      return 2;
    } else if (device == DeviceType.Tablet) {
      return 3;
    } else {
      return 4;
    }
  }

  double get brandGrid {
    return ((width -
                (mainPadding! * 2) -
                space! * 2 -
                (space! * (countItem - 1))) /
            countItem) -
        0.1;
  }

  @override
  Widget build(BuildContext context) {
    getDevice(width);
    print(width);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFffffff),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFb1b3b5),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 0))
            ],
          ),
          padding: EdgeInsets.only(
              left: space!, right: space!, bottom: space!, top: space!),
          child: Wrap(
            spacing: space!,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: List.generate(
                mostLikedItems.length > 6 ? 6 : mostLikedItems.length,
                (index) => SizedBox(
                    width: brandGrid,
                    child: CustomPaint(
                      painter: MostLikedPainter(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: width / 25),
                          Image.asset(
                            mostLikedItems[index].image!,
                            width: brandGrid * 0.60,
                            height: device == DeviceType.Desktop ||
                                    device == DeviceType.Tablet
                                ? 100
                                : 70,
                          ),
                          const SizedBox(height: 5),
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
        ),
        mostLikedItems.length > 6
            ? const TextButton(onPressed: null, child: Text("Show all items"))
            : const SizedBox()
      ],
    );
  }
}

class MostLikedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFe6e6e6);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width / 2, 0);
    canvas.drawShadow(path, Colors.black, 3, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
