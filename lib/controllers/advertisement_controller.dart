import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sliders extends GetxController {
  late PageController move;
  double? offset;
  double? moveTo;
  static double? height;
  final double? mainPadding;
  final int? contentCount;
  final double? width;
  final int? movementDurationPerMilliseconds;
  final int? repetitionDurationPerSecond;
  Color? stage;
  dynamic stageIcon;

  Sliders(
      {this.width,
      this.mainPadding,
      this.offset,
      this.movementDurationPerMilliseconds,
      this.repetitionDurationPerSecond,
      this.contentCount});

  List<Widget> initValue() {
    return List.generate(contentCount!, (index) {
      return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == (offset)
              ? const Color(0xFF049cc2)
              : const Color(0xFF02132b),
        ),
      );
    });
  }

  bool direction = true;
  int pageOffset = 0;
  List<Widget> stages() {
    stageIcon = List.generate(contentCount!, (index) {
      return Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == (move.page!.toInt())
                ? const Color(0xFF049cc2)
                : const Color(0xFF02132b),
          ));
    });
    return stageIcon;
  }

  sizes() {
    if (width! >= 1100) {
      moveTo = width! - (mainPadding! * 2);
      height = 150;
    } else {
      moveTo = width! - (mainPadding! * 2);
      height = 110;
    }
  }

  bool moveState = true;
  bool moveStateVal() {
    if (move.page!.toInt() == contentCount! - 1) {
      moveState = false;
      return moveState;
    } else if (move.page!.toInt() == 0) {
      moveState = true;
      return moveState;
    }
    return moveState;
  }

  double moving() {
    moveStateVal();
    if (moveState == false && offset != 0.0 && moveState == false) {
      return previous();
    } else if (moveState == true && moveState == true) {
      return next();
    }
    return move.page!;
  }

  int? count;
  double previous() {
    count = move.page!.toInt() - 1;
    offset = count! * moveTo!;
    return offset!;
  }

  double next() {
    count = move.page!.toInt() + 1;
    offset = count! * moveTo!;
    return offset!;
  }

  moveSlide() {
    if (move.hasClients) {
      move.animateTo(moving(),
          duration: Duration(milliseconds: movementDurationPerMilliseconds!),
          curve: Curves.easeIn);
    }
  }

  Future call() async {
    await Future.delayed(Duration(seconds: repetitionDurationPerSecond!),
        () async {
      await moveSlide();
    });
    call();
    update();
  }

  Future stageListen() async {
    await Future.delayed(const Duration(milliseconds: 50), () {
      stages();
    });
    stageListen();
    update();
  }
}

class AdvertiseController extends Sliders {
  late PageController advertiseController;

  final double? mainPadding;
  final int? contentCount;
  final double? width;
  final int? movementDurationPerMilliseconds;
  final int? repetitionDurationPerSecond;
  double? offset;

  AdvertiseController(
      {this.contentCount,
      this.offset,
      this.movementDurationPerMilliseconds,
      this.repetitionDurationPerSecond,
      this.mainPadding,
      this.width});

  @override
  onInit() {
    move = PageController();
    sizes();
    call();
    stageListen();
  }
}

class WeeklyController extends Sliders {
  late PageController weeklyController;
  final double? mainPadding;
  final int? contentCount;
  final double? width;
  final int? movementDurationPerMilliseconds;
  final int? repetitionDurationPerSecond;
  double? offset;

  WeeklyController(
      {this.contentCount,
      this.offset,
      this.movementDurationPerMilliseconds,
      this.repetitionDurationPerSecond,
      this.mainPadding,
      this.width});
  @override
  onInit() {
    move = PageController();
    sizes();
    call();
    stageListen();
  }
}
