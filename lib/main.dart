import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvi/feature/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('MVI 맛보기'),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Center(
                child: SizedBox(
                  width: Get.width / 2,
                  height: Get.height / 2,
                  child: const HomeView(),
                ),
              ),
            )));
  }
}
