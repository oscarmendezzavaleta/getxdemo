import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/global_controller.dart';
import 'package:getx_demo/pages/reactive_page.dart';
import 'package:getx_demo/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReactivePage(),
    );
  }
}
