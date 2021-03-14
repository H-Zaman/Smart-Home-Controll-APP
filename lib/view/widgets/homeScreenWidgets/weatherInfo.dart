import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/utility/appConst.dart';

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConst.main,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeatherInfoWidget(top: Icon(
                  CupertinoIcons.cloud_heavyrain,
                  color: Colors.white,
                ), title: 'Heavy Rain'),
                WeatherInfoWidget(
                    top: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '19',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                            )
                        ),
                        Text(
                            '℃',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.4,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ],
                    ),
                    title: 'Temp Outside'
                ),
                WeatherInfoWidget(
                    top: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '24',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                            )
                        ),
                        Text(
                            '℃',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.4,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ],
                    ),
                    title: 'Temp Inside'
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WeatherInfoWidget extends StatelessWidget {
  final Widget top;
  final String title;

  const WeatherInfoWidget({Key key, this.top, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        top,
        SizedBox(height: 3),
        Text(
          title,
          style: TextStyle(
              color: Colors.white
          ),
        )
      ],
    );
  }
}