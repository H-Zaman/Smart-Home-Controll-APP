import 'package:flutter/cupertino.dart';

class LightSwitchModel{
  String title;
  int watt;
  double value;
  bool state;
  LightSwitchModel({
   @required this.title,
   @required this.watt,
   @required this.value,
   @required this.state,
});
}