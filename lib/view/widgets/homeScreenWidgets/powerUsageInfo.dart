import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/utility/appConst.dart';

class PowerUsageInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(20)
      ),
      height: 90,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PowerUsageInfoWidget(
            icon: Icons.electrical_services_rounded,
            title: '29.5',
            subTitle: 'Power usage today',
          ),
          PowerUsageInfoWidget(
            icon: CupertinoIcons.bolt_circle,
            title: '303',
            subTitle: 'Power usage this month',
          )
        ],
      ),
    );
  }
}

class PowerUsageInfoWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const PowerUsageInfoWidget({Key key, this.icon, this.title, this.subTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppConst.defaultColor,
          size: 40,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                  text: title,
                  style: TextStyle(
                      color: AppConst.defaultColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                        text: ' KwH',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16
                        )
                    )
                  ]
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                  color: AppConst.defaultColor,
                  fontSize: 12
              ),
            )
          ],
        )
      ],
    );
  }
}