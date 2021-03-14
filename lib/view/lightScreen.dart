import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/utility/appConst.dart';
import 'package:smarthome/view_model/_demoData.dart';

class LightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Light'
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: AppConst.main,
      body: Stack(
        children: [
          TopInfo(),
          BottomInfo()
        ],
      ),
    );
  }
}



class TopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Get.height * .4),
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,25,30,0),
                  child: Text(
                    'Power',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                  child: Obx(()=>Transform.scale(
                    scale: 1.4,
                    child: CupertinoSwitch(
                      value: DemoData.state.value,
                      onChanged: DemoData.changeState,
                      activeColor: AppConst.lightColor,
                      trackColor: Colors.red,
                    ),
                  )),
                ),
                SizedBox(height: 40),
                Obx(()=>Padding(
                  padding: const EdgeInsets.fromLTRB(30,25,30,0),
                  child: Text(
                    DemoData.state.value ? '${DemoData.value.value.toStringAsFixed(0)} %' : 'OFF',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,0),
                  child: Text(
                    'Brightness',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                SliderWidget()
              ],
            ),
          ),
          IlluminationWidget(),
          LightImage(),

        ],
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Intensity',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[350],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.lightbulb,
                color: AppConst.grey,
              ),
              Column(
                children: [
                  Obx(()=>IgnorePointer(
                    ignoring: !DemoData.state.value,
                    child: SizedBox(
                      width: Get.width * .7,
                      child: Slider(
                          min: 10,
                          max: 100,
                          activeColor: AppConst.grey,
                          inactiveColor: Colors.grey[350],
                          value: DemoData.value.value,
                          onChanged: DemoData.changeValue
                      ),
                    ),
                  )),
                  SizedBox(
                    width: Get.width * .7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 14,
                          width: 2,
                          color: AppConst.grey,
                        ),
                        Container(
                          height: 14,
                          width: 2,
                          color: AppConst.grey,
                        ),
                        Container(
                          height: 14,
                          width: 2,
                          color: AppConst.grey,
                        ),
                        Container(
                          height: 14,
                          width: 2,
                          color: AppConst.grey,
                        ),
                        Container(
                          height: 14,
                          width: 2,
                          color: AppConst.grey,
                        ),
                        Container(
                          height: 14,
                          width: 2,
                          color: AppConst.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Icon(
                CupertinoIcons.lightbulb_fill,
                color: AppConst.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IlluminationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 160,
      right: 00,
      child: Obx(()=>AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: !DemoData.state.value ? 0 : DemoData.value.value/100,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: 155,
          height: 155,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(.95),
                    Colors.white.withOpacity(.8),
                    Colors.white.withOpacity(.5),
                    Colors.white.withOpacity(.4),
                  ]
              ),
              shape: BoxShape.circle
          ),
        ),
      )),
    );
  }
}

class LightImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -45,
      top: -50,
      child: Container(
        height: Get.height * .4,
        width: Get.width * .5,
        margin: EdgeInsets.only(bottom: 0,left: 20,right: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/lightpng.png')
            )
        ),
      ),
    );
  }
}

class BottomInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * .65,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )
        ),
        child: Column(
          children: [
            Container(
              height: Get.height * .13,
              width: Get.width,
              padding: EdgeInsets.fromLTRB(25,20,25,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppConst.defaultColor
                        ),
                      ),
                      Icon(
                        CupertinoIcons.add,
                        color: AppConst.defaultColor,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          color: AppConst.defaultColor
                        ),
                      ),

                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '06:00',
                                style: TextStyle(
                                    color: AppConst.defaultColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                ' pm',
                                style: TextStyle(
                                  color: AppConst.defaultColor,
                                  height: 1.2
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '  TO  ',
                            style: TextStyle(
                              color: AppConst.defaultColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '11:00',
                                style: TextStyle(
                                    color: AppConst.defaultColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                ' pm',
                                style: TextStyle(
                                  color: AppConst.defaultColor,
                                  height: 1.2
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.delete,
                            color: AppConst.defaultColor,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.ellipsis,
                            color: AppConst.defaultColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  )
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  itemCount: DemoRowData.data.length,
                  itemBuilder: (_, index) => RowDataWidget(data: DemoRowData.data[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowDataWidget extends StatelessWidget {
  final DemoRowData data;

  const RowDataWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.title,
            style: TextStyle(
              fontSize: 16,
              color: AppConst.defaultColor
            ),
          ),
          Text(
            data.value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppConst.defaultColor
            ),
          ),
        ],
      ),
    );
  }
}
