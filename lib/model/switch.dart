import 'package:flutter/cupertino.dart';

class Model{
  String title;
  int watt;
  double value;
  bool state;
  Model({
   @required this.title,
   @required this.watt,
   @required this.value,
   @required this.state,
});
}