import 'package:get/get.dart';

class StartPage extends GetxController {
  StartPage({this.width, this.logo});

  final double? width;
  double trick = 0;
  double? opacity = 1.0;
  String? logo;

  toRight() {
    trick = width!;
    opacity = 0.0;
    update();
  }

  start() async {
    await Future.delayed(const Duration(seconds: 3), () {
      toRight();
    });
  }
}
