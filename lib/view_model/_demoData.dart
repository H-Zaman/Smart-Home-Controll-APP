import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoSceneModel{

  static RxInt selectedScene = 0.obs;
  static changeScene(int index) => selectedScene.value = index;


  IconData icon;
  String title;

  DemoSceneModel({ @required this.icon,@required this.title});

  static List<DemoSceneModel> data = [
    DemoSceneModel(
      icon: Icons.home,
      title: 'Home'
    ),
    DemoSceneModel(
        icon: CupertinoIcons.heart_circle_fill,
        title: 'Romantic'
    ),
    DemoSceneModel(
        icon: CupertinoIcons.music_house_fill,
        title: 'Party'
    ),
    DemoSceneModel(
        icon: CupertinoIcons.moon_zzz_fill,
        title: 'Sleep'
    ),
    DemoSceneModel(
        icon: CupertinoIcons.alarm_fill,
        title: 'Get up'
    ),
    DemoSceneModel(
      icon: Icons.sensor_door_outlined,
      title: 'Away'
    ),

  ];
}

class DemoRoomModel{
  String image;
  String title;
  int roomNo;
  DemoRoomModel({this.title, this.image, this.roomNo});

  static List<DemoRoomModel> data = [
    DemoRoomModel(
        image: 'assets/livingroom.png',
        title: 'Living Room',
        roomNo: 4
    ),
    DemoRoomModel(
      image: 'assets/bedroom.png',
      title: 'BedRoom',
      roomNo: 7
    ),
    DemoRoomModel(
      image: 'assets/kitchen.png',
      title: 'Kitchen',
      roomNo: 5
    ),
  ];
}

class DemoDeviceModel{
  IconData icon;
  String title;
  String value;
  bool status;
  DemoDeviceModel({
    this.title,
    this.value,
    this.icon,
    this.status
});

  static List<DemoDeviceModel> data = [
    DemoDeviceModel(
      title: 'Light',
      value: '80%',
      icon: CupertinoIcons.lightbulb_fill,
      status: true,
    ),
    DemoDeviceModel(
      title: 'AC',
      value: '43\u00B0',
      icon: CupertinoIcons.snow,
      status: false,
    ),
    DemoDeviceModel(
      title: 'Wi-fi',
      icon: CupertinoIcons.wifi,
      value: 'On',
      status: false,
    ),
    DemoDeviceModel(
      title: 'Speaker',
      value: 'High',
      icon: CupertinoIcons.speaker_3_fill,
      status: false,
    ),
    DemoDeviceModel(
      title: 'Smart TV',
      icon: CupertinoIcons.tv_fill,
      status: false,
      value: 'Off'
    ),
  ];

}

class DemoRowData{
  String title;
  String value;
  DemoRowData({this.title, this.value});
  static List<DemoRowData> data = [
    DemoRowData(title: 'Usage today', value: '0.5 KwH'),
    DemoRowData(title: 'Usage this month', value: '6 KwH'),
    DemoRowData(title: 'Total working hrs', value: '125'),
  ];
}

class DemoData{
  static RxDouble value = 80.0.obs;
  static RxBool state = true.obs;
  static changeValue(double newValue) => value.value = newValue;
  static changeState(bool newState) => state.value = newState;
}