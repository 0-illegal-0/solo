import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/view/responsive.dart';

class Important extends StatelessWidget {
  const Important({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangeColor controller = Get.put(ChangeColor());
    return device == DeviceType.Desktop
        ? GetBuilder<ChangeColor>(builder: (context) {
            return InkWell(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.only(top: 150),
                padding: const EdgeInsets.only(left: 10),
                color: controller.styleColor,
                width: 150,
                height: 50,
                child: CustomPaint(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Important",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: sizesResponsive(
                                mobile: 18,
                                teblet: 20,
                                desktop: 25,
                                device: device))),
                  ),
                  painter:
                      CurvePainterImportant(color: const Color(0xFFffffff)),
                ),
              ),
            );
          })
        : const SizedBox();
  }
}

class ChangeColor extends GetxController {
  Color styleColor = const Color(0xFFfc0339);
  int x = 0;

  changeColor() async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      if (x == 0) {
        styleColor = const Color(0xFFfcb103);
        x = 1;
      } else {
        styleColor = const Color(0xFFfc0339);
        x = 0;
      }
    });
    changeColor();
    update();
  }

  @override
  void onInit() {
    changeColor();
    super.onInit();
  }
}

class CurvePainterImportant extends CustomPainter {
  CurvePainterImportant({this.color});
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width * 0.75, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
