import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/view/widgets/lightSwitchSliderWidget.dart';
import 'package:smarthome/view_model/switch_data.dart';

class Lights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ViewModel.switches.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 30),
      itemBuilder: (_, index) => LightSliderSwitch(item: ViewModel.switches[index]),
    );
  }
}
