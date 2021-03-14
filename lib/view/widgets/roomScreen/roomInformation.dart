import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';
import 'package:smarthome/utility/appConst.dart';

class RoomInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConst.main,
      height: Get.height * .5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TemperatureInfo(),
          PowerUsageGraph(),
        ],
      ),
    );
  }
}

class TemperatureInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      height: Get.height * .12,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TemperatureInfoWidget(
            icon: Icons.thermostat_rounded,
            isPercentage: false,
            value: '25',
            title: 'Temperature',
          ),
          TemperatureInfoWidget(
            icon: CupertinoIcons.drop_fill,
            isPercentage: true,
            value: '57',
            title: 'Humidity',
          ),
          TemperatureInfoWidget(
            icon: CupertinoIcons.lightbulb_fill,
            isPercentage: true,
            value: '80',
            title: 'Lighting',
          ),
        ],
      ),
    );
  }
}

class TemperatureInfoWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  final bool isPercentage;
  final String title;

  const TemperatureInfoWidget({Key key, this.icon, this.value, this.isPercentage, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppConst.defaultColor,
              size: 20,
            ),
            SizedBox(width: 3),
            Text(
              value,
              style: TextStyle(
                color: AppConst.defaultColor,
                fontSize: 22
              ),
            ),
            Text(
              isPercentage ? '%' : '℃',
              style: TextStyle(
                color: AppConst.defaultColor.withOpacity(.7),
                fontSize: 14,
                height: 1.3
              ),
            ),
          ],
        ),
        Text(
          ' '+title,
          style: TextStyle(
            color: AppConst.defaultColor,
          ),
        )
      ],
    );
  }
}

class PowerUsageGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<LineChartModel> data = [
      LineChartModel(amount: 20, date: DateTime(2020, 1, 1)),
      LineChartModel(amount: 40, date: DateTime(2020, 1, 2)),
      LineChartModel(amount: 100, date: DateTime(2020, 1, 4)),
      LineChartModel(amount: 80, date: DateTime(2020, 1, 5)),
      LineChartModel(amount: 20, date: DateTime(2020, 1, 6)),
      LineChartModel(amount: 25, date: DateTime(2020, 1, 10)),
      LineChartModel(amount: 39, date: DateTime(2020, 1, 11)),
      LineChartModel(amount: 100, date: DateTime(2020, 1, 12)),
    ];
    return Container(
      height: Get.height * .22,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Usage Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '25',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    Text(
                      'KwH',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.3
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          LineChart(
            insidePadding: 25,
            width: MediaQuery.of(context).size.width*.9, // Width size of chart
            height: Get.height * .14, // Height size of chart
            data: data, // The value to the chart
            showCircles: true,
            circlePaint: Paint()
              ..strokeWidth = 3
              ..style = PaintingStyle.stroke
              ..color = Colors.white,
            linePaint: Paint()
              ..strokeWidth = 3
              ..style = PaintingStyle.stroke
              ..color = Colors.white, // Custom paint for the line
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: data.map((e) => Text(
              '${data.indexOf(e)+1} pm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),
            )).toList(),
          )
        ],
      )
    );
  }
}
