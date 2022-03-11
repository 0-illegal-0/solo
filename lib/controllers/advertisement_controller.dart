import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/advertisement_models.dart';

class Sliders extends GetxController {
  static late ScrollController move = ScrollController();
  double offset;
  static String text = "Text";
  static double? moveTo;
  double? max;
  static double? height;
  final int contentCount;
  final width;
  final int movementDurationPerMilliseconds;
  final int repetitionDurationPerSecond;
  Color? stage;
  static dynamic foo;

  Sliders(
      {this.width,
      required this.offset,
      required this.movementDurationPerMilliseconds,
      required this.repetitionDurationPerSecond,
      required this.contentCount});

  onInit() {
    execute();
  }

  List<Widget> initValue() {
    return List.generate(advertisements.length, (index) {
      print(offset);
      return Container(
        color: index == (offset / moveTo!) ? Colors.green : Colors.amber,
        width: 25,
        height: 13,
      );
    });
  }

  List<Widget> stages() {
    foo = List.generate(advertisements.length, (index) {
      return Container(
        color: index == (offset / moveTo!) ? Colors.green : Colors.amber,
        width: 25,
        height: 13,
      );
    });
    return foo;
  }

  sizes() {
    if (width >= 1100) {
      moveTo = 1100;
      height = 150;
    } else {
      moveTo = width;
      moveTo = moveTo! - 20;
      height = 110;
      max = moveTo! * contentCount;
    }
  }

  double moving() {
    if (offset == max && offset != 0) {
      max = max! - moveTo!;
      return previous();
    } else {
      max = moveTo! * contentCount;
    }
    return next();
  }

  double previous() {
    offset = offset - moveTo!;
    return offset;
  }

  double next() {
    offset = offset + moveTo!;
    return offset;
  }

  moveSlide() {
    if (move.hasClients) {
      move.animateTo(moving(),
          duration: Duration(milliseconds: movementDurationPerMilliseconds),
          curve: Curves.easeIn);
    }
  }

  Future call() async {
    await Future.delayed(Duration(seconds: repetitionDurationPerSecond), () {
      moveSlide();
      stages();
    });
    call();
    update();
  }

  execute() {
    sizes();
    call();
  }
}
