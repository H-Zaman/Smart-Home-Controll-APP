import 'package:flutter/cupertino.dart';

class Model{
  String title;
  int watt;
  int value;
  bool state;
  Model({
   @required this.title,
   @required this.watt,
   @required this.value,
   @required this.state,
});
}