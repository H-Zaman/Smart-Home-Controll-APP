import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/utility/appConst.dart';
import 'package:smarthome/view_model/_demoData.dart';

import 'widgets/roomScreen/roomDevices.dart';
import 'widgets/roomScreen/roomInformation.dart';

class RoomScreen extends StatelessWidget {
  final DemoRoomModel data;

  const RoomScreen({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.main,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Hero(
              tag: data.image,
              child: Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        data.image
                    )
                  )
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              data.title
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.settings_outlined
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            RoomInformation(),
            RoomDevices(),
          ],
        ),
      ),
    );
  }
}
