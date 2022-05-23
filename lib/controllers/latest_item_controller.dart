import 'package:get/get.dart';

class MoveSlider extends GetxController {
  MoveSlider({this.itemsList, this.width});
  double moveUnit = 0;
  int moveCount = 0;
  double? width;
  List? itemsList;
  int get wrapCount {
    return (itemsList!.length / (5)).ceil();
  }

  moveNext() {
    if (moveCount < wrapCount - 1) {
      moveUnit = moveUnit - width!;
      moveCount = moveCount + 1;
    }
    update();
  }

  moveBack() {
    if (moveCount > 0) {
      moveUnit = moveUnit + width!;
      moveCount = moveCount - 1;
    }
    update();
  }
}

class MoveSliderMain extends GetxController {
  MoveSliderMain({this.itemsList, this.width});
  double moveUnit = 0;
  int moveCount = 0;
  double? width;
  List? itemsList;
  int get wrapCount {
    return (itemsList!.length / (6 * 2)).ceil();
  }

  moveNext() {
    if (moveCount < wrapCount - 1) {
      moveUnit = moveUnit - width!;
      moveCount = moveCount + 1;
    }
    update();
  }

  moveBack() {
    if (moveCount > 0) {
      moveUnit = moveUnit + width!;
      moveCount = moveCount - 1;
    }
    update();
  }
}

class MoveSlider3 extends MoveSliderMain {
  MoveSlider3({this.itemsList, this.width});
  double? width;
  List? itemsList;
  /*MoveSlider3({this.itemsList, this.width});
  double moveUnit = 0;
  int moveCount = 0;
  double? width;
  List? itemsList;
  int get wrapCount {
    return (itemsList!.length / (6 * 2)).ceil();
  }

  moveNext() {
    if (moveCount < wrapCount - 1) {
      moveUnit = moveUnit - width!;
      moveCount = moveCount + 1;
    }
    update();
  }

  moveBack() {
    if (moveCount > 0) {
      moveUnit = moveUnit + width!;
      moveCount = moveCount - 1;
    }
    update();
  }*/
}
