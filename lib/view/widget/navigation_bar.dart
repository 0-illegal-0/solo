import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/controllers/navigation-state.dart';

class NavigationBar extends StatelessWidget {
  NavigationBar({
    Key? key,
  }) : super(key: key);
  NavigationState controller3 = Get.put(NavigationState(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationState>(
      builder: (controller3) => BottomNavigationBar(
          currentIndex: controller3.change3(),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          selectedIconTheme: const IconThemeData(color: Colors.green),
          unselectedIconTheme: const IconThemeData(),
          onTap: (val) {
            controller3.bottombar(val);
            bottomSheet(context);
          },
          items: List.generate(
            4,
            (index) => BottomNavigationBarItem(
              icon: bottomNavDetails[index]["icon"],
              label: bottomNavDetails[index]["title"],
            ),
          )),
    );
  }

  bottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 100,
              color: Colors.white,
              child: const Text("empety"),
            ));
  }
}

List<Map<String, dynamic>> bottomNavDetails = [
  {"title": "Home", "icon": const Icon(Icons.home_outlined)},
  {"title": "Categories", "icon": const Icon(Icons.category_outlined)},
  {
    "title": "Cart",
    "icon": Image.asset(
      "assets/images/bar_icon/deal.png",
      width: 37,
      //color: Colors.blue,
    )
  },
  {
    "title": "Account",
    "icon": const Icon(
      Icons.person_outline,
      //  size: 35,
    ),
  },
];
