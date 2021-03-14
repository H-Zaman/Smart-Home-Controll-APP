import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/view/homeScreen.dart';

main ()=> runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
