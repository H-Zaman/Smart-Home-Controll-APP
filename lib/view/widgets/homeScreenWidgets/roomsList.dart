import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/utility/appConst.dart';
import 'package:smarthome/view/roomScreen.dart';
import 'package:smarthome/view_model/_demoData.dart';

class RoomsHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(25,10,25,10),
            child: Text(
              'Rooms',
              style: TextStyle(
                  color: AppConst.defaultColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: DemoRoomModel.data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, index) => RoomsItemWidget(data: DemoRoomModel.data[index]),
            ),
          )
        ],
      ),
    );
  }
}

class RoomsItemWidget extends StatelessWidget {
  final DemoRoomModel data;

  const RoomsItemWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=>RoomScreen(data: data)),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Hero(
                    tag: data.image,
                    child: Image.asset(data.image)),
                )
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppConst.defaultColor
                      ),
                    ),
                    Text(
                      '${data.roomNo} Devices',
                      style: TextStyle(
                        color: AppConst.grey
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
