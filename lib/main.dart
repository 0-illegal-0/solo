import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solo/view/screens/home/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          )),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
