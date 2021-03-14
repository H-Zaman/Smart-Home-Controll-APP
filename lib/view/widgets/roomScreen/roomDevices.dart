import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/utility/appConst.dart';
import 'package:smarthome/view/lightScreen.dart';
import 'package:smarthome/view_model/_demoData.dart';

class RoomDevices extends StatelessWidget {
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
          color: Color(0xffF2F2F2),
        ),
        width: Get.width,
        height: Get.height * .5,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0,25,0,10),
              child: Text(
                'Devices',
                style: TextStyle(
                    color: AppConst.defaultColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 16/12,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                padding: EdgeInsets.only(bottom: 15),
                itemCount: DemoDeviceModel.data.length,
                itemBuilder: (_, index) => RoomDeviceItem(data:DemoDeviceModel.data[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoomDeviceItem extends StatefulWidget {
  final DemoDeviceModel data;

  const RoomDeviceItem({Key key, this.data}) : super(key: key);

  @override
  _RoomDeviceItemState createState() => _RoomDeviceItemState();
}

class _RoomDeviceItemState extends State<RoomDeviceItem> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Get.to(()=>LightScreen()),
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: widget.data.status ? AppConst.lightColor : Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  widget.data.icon,
                  size: 28,
                  color: widget.data.status ? Colors.white : AppConst.defaultColor,
                ),
                Text(
                  widget.data.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.data.status ? Colors.white : AppConst.defaultColor,
                  ),
                ),
                Text(
                  widget.data.value,
                  style: TextStyle(
                    color: widget.data.status ? Colors.white : AppConst.defaultColor,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 25,
            right: 25,
            child: InkWell(
              onTap: (){
                setState(() {
                  widget.data.status = !widget.data.status;
                });
              },
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: widget.data.status ? Colors.white : AppConst.lightColor
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
