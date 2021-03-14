import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/utility/appConst.dart';

import 'widgets/homeScreenWidgets/powerUsageInfo.dart';
import 'widgets/homeScreenWidgets/roomsList.dart';
import 'widgets/homeScreenWidgets/scenesList.dart';
import 'widgets/homeScreenWidgets/weatherInfo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConst.main,
        centerTitle: true,
        title: Text('Control Panel'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
                CupertinoIcons.bell
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
          WeatherInfo(),
          MainBody(),
        ],
      ),
    );
  }
}


class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          color: Colors.white
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .77,
        child: Column(
          children: [
            PowerUsageInfo(),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Color(0xffF2F2F2),
                ),
                child: Column(
                  children: [
                    ScenesHorizontalList(),
                    RoomsHorizontalList(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


