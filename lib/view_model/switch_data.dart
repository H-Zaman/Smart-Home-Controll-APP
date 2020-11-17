import 'package:smarthome/model/switch.dart';

class ViewModel{
  static List<Model> switches = [
    Model(title: 'Bedroom', watt: 85, value: 85, state: true),
    Model(title: 'Kitchen', watt: 55, value: 70, state: true),
    Model(title: 'Bathroom', watt: 60, value: 40, state: false),
    Model(title: 'Living room', watt: 100, value: 100, state: true),
  ];
}