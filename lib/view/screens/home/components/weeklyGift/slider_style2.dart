import 'package:flutter/material.dart';

class SlidersStyle2 extends StatelessWidget {
  const SlidersStyle2({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFcf9e0c),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: 150,
              child: CustomPaint(
                  painter: SlidersStyle2Painter(color: Colors.green))),
          const Positioned(
            top: 10,
            left: 10,
            child: Text("Big Sale",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold)),
          ),
          const Positioned(
            top: 40,
            left: 10,
            child: Text("HD Smart TV",
                style: TextStyle(
                    color: Color(0xff0cb7c9),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          Positioned(
            left: 30,
            bottom: 10,
            child: Container(
              width: 70,
              height: 70,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFcf9e0c)),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "UP TO",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        )),
                    TextSpan(
                        text: "\n30%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    TextSpan(
                        text: "\nOFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ))
                  ])),
            ),
          ),
          Positioned(
              top: 30,
              right: 15,
              child: Image.asset(
                "assets/images/tv/tv2.png",
                width: 150,
              ))
        ],
      ),
    );
  }
}

class SlidersStyle2Painter extends CustomPainter {
  SlidersStyle2Painter({this.color});
  @override
  final Color? color;
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFb00b31);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(size.width * 0.33, 0);
    path.lineTo(size.width * 0.50, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
