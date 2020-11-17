import 'package:smarthome/model/switch.dart';

class ViewModel{
  static List<Model> switches = [
    Model(title: 'Bedroom', watt: 85, value: 35, state: true),
    Model(title: 'Kitchen', watt: 85, value: 35, state: true),
    Model(title: 'Bathroom', watt: 85, value: 35, state: false),
    Model(title: 'Living room', watt: 85, value: 35, state: true),
  ];
}