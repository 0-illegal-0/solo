import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:get/get.dart';

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
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
            headline6: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          )),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
