import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/utility/appConst.dart';
import 'package:smarthome/view_model/_demoData.dart';

class ScenesHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25,30,25,10),
          child: Text(
            'Scenes',
            style: TextStyle(
                color: AppConst.defaultColor,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),
        SizedBox(
          height: Get.height * .12,
          child: ListView.builder(
            itemCount: DemoSceneModel.data.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) => SceneItemWidget(index: index),
          ),
        )
      ],
    );
  }
}

class SceneItemWidget extends StatelessWidget {
  final int index;

  const SceneItemWidget({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DemoSceneModel data = DemoSceneModel.data[index];
    return Obx(()=>InkWell(
      onTap: () => DemoSceneModel.changeScene(index),
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: index == DemoSceneModel.selectedScene.value ? AppConst.mainDark : Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  data.icon,
                  color: index == DemoSceneModel.selectedScene.value ? Colors.white : AppConst.defaultColor,
                  size: 40,
                ),
                Text(
                  data.title,
                  style: TextStyle(
                    color: index == DemoSceneModel.selectedScene.value ? Colors.white : AppConst.defaultColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}