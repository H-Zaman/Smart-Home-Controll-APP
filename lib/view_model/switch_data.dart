import 'package:smarthome/model/switch.dart';

class ViewModel{
  static List<LightSwitchModel> switches = [
    LightSwitchModel(title: 'Bedroom', watt: 85, value: 85, state: true),
    LightSwitchModel(title: 'Kitchen', watt: 55, value: 70, state: true),
    LightSwitchModel(title: 'Bathroom', watt: 60, value: 40, state: false),
    LightSwitchModel(title: 'Living room', watt: 100, value: 100, state: true),
  ];
}