import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solo/view/screens/cart/cart_budget.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:get/get.dart';
import 'package:solo/view/screens/privacy/privacy_policy.dart';
import 'package:solo/view/screens/product-page/product_page.dart';
import 'package:solo/view/screens/view-details/view_details.dart';
import 'package:solo/view/widget/show_item_wrap.dart';
import 'view/screens/login_register/login.dart';
import 'view/widget/navigation_bar.dart';

void main() async {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/product-page",
          page: () => ProductPage(),
        ),
        GetPage(
          name: "/view-details",
          page: () => ViewDetails(),
        ),
        GetPage(
          name: "/cart",
          page: () => CartBudget(),
        ),
        GetPage(
          name: "/login",
          page: () => const Login(),
        ),
        GetPage(
          name: "/contact-us",
          page: () => const InProgress(),
        ),
        GetPage(
          name: "/help",
          page: () => const InProgress(),
        ),
        GetPage(
          name: "/about-us",
          page: () => const InProgress(),
        ),
        GetPage(
          name: "/privacy-policy",
          page: () => const PrivacyPolicy(),
        ),
        GetPage(
          name: "/show-item-wrap",
          page: () => ShowItemWrap(),
        ),
      ],
      theme: ThemeData(
          textTheme: const TextTheme(
        headline6: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
      )),
      home: const HomePage(),
    );
  }
}
