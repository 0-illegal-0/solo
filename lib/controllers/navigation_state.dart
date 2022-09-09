import 'package:get/get.dart';

class NavigationState extends GetxController {
  var x = 'white';

  doo(String newVal) {
    x = newVal;
    update();
    return x;
  }

  int currents = 0;
  bottombar(val) {
    currents = val;
    update();
    return currents;
  }

  int change3() {
    update();
    return currents;
  }
}
