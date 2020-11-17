import 'package:flutter/material.dart';
import 'package:smarthome/view/homeScreen.dart';

main ()=> runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.tealAccent
      ),
      home: HomeScreen(),
    );
  }
}
