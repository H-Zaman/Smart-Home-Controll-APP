import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/model/switch.dart';

class LightSliderSwitch extends StatefulWidget {
  final LightSwitchModel item;

  const LightSliderSwitch({Key key, this.item}) : super(key: key);

  @override
  _LightSliderSwitchState createState() => _LightSliderSwitchState();
}

class _LightSliderSwitchState extends State<LightSliderSwitch> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          height: 100,
          width: 280 * (widget.item.value/100),
          duration: Duration(microseconds: 100),
          decoration: BoxDecoration(
              color: widget.item.state ? Color(0xff2ecc71).withOpacity(widget.item.value/100) : Colors.transparent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
          ),
        ),
        Container(
          height: 100,
          margin: EdgeInsets.only(bottom: 15),
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Color(0xff27ae60).withOpacity(.1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
          ),
          child: Stack(
            children: [
              /// bulb image
              IgnorePointer(
                ignoring: widget.item.state ? false : true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          left: 5,
                          right: 5,
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 0),
                            width: 60,
                            height: widget.item.state ? 60 * (widget.item.value/100) : 60,
                            decoration: BoxDecoration(
                                color: widget.item.state ? Color(0xfff1c40f) : Colors.redAccent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(1111),
                                  topLeft: Radius.circular(1111),
                                  bottomLeft: Radius.circular(222),
                                  bottomRight: Radius.circular(222),
                                )
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/bulb.png'),
                                fit: BoxFit.contain,
                              )
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.item.value.toStringAsFixed(2) + ' %',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.benchNine(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),

              /// title, watt
              Positioned(
                top: 0,
                bottom: 0,
                left: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.item.title,
                      style: GoogleFonts.aBeeZee(
                          fontSize: 32,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      widget.item.watt.toString() + ' watt',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),

              /// main slider
              IgnorePointer(
                ignoring: widget.item.state ? false : true,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0,
                      right: 55
                  ),
                  child: SliderTheme(
                    data: SliderThemeData(
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                      overlayColor: Colors.transparent,
                      overlappingShapeStrokeColor: Colors.transparent,

                      thumbColor: Colors.transparent,
                      trackShape: RectangularSliderTrackShape(
                          disabledThumbGapWidth: 0
                      ),
                      thumbShape: RoundSliderThumbShape(
                          elevation: 0,
                          enabledThumbRadius: 0,
                          disabledThumbRadius: 0
                      ),
                      trackHeight: 100,
                    ),
                    child: Slider(
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      value: widget.item.value,
                      min: 10.0,
                      max: 100.0,
                      onChanged: (value){
                        setState(() {
                          widget.item.value = value;
                        });
                      },
                    ),
                  ),
                ),
              ),

              /// switch
              Align(
                alignment: Alignment.centerRight,
                child: CupertinoSwitch(
                  value: widget.item.state,
                  onChanged: (value){
                    setState(() {
                      widget.item.state = value;
                    });
                  },
                  trackColor: Color(0xffe67e22),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
