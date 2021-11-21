// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Alarm',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
            Expanded(
              child: ListView(
                children: alarms.map<Widget>((alarm) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 32),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: alarm.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: alarm.gradientColors.last.withOpacity(0.4),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(4, 4))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Text('Office',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'avenir')),
                              ],
                            ),
                            Switch(
                              value: true,
                              onChanged: (bool value) {},
                              activeColor: Colors.white,
                            )
                          ],
                        ),
                        Text(
                          'Mon-Fri',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              '07:00 AM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24),
                            ),
                            Icon(Icons.keyboard_arrow_down,
                                color: Colors.white, size: 36)
                          ],
                        )
                      ],
                    ),
                  );
                }).followedBy([
                  DottedBorder(
                    strokeWidth: 2,
                    color: CustomColors.clockOutline,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(24),
                    dashPattern: [5, 4],
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: CustomColors.clockBG,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16)),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/add_alarm.png',
                                scale: 1.5,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Add alarm',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'avenir'),
                              )
                            ],
                          ),
                        )),
                  )
                ]).toList(),
              ),
            ),
          ],
        ));
  }
}
