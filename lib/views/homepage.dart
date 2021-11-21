// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/menu_info.dart';
import 'package:clock_app/views/alarm_page.dart';
import 'package:clock_app/views/clock_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildTextButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(color: Colors.white, width: 1),
          Expanded(
            child: Consumer<MenuInfo>(builder: (context, value, child) {
              if (value.menuType == MenuType.clock) {
                return ClockPage();
              } else if (value.menuType == MenuType.alarm) {
                return AlarmPage();
              } else
                // ignore: curly_braces_in_flow_control_structures
                return Container(
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(fontSize: 20),
                          children: <TextSpan>[
                        TextSpan(text: 'Testing \n'),
                        TextSpan(
                          text: value.title,
                          style: TextStyle(fontSize: 48),
                        )
                      ])),
                );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildTextButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) {
        return TextButton(
          // padding: const EdgeInsets.symmetric(vertical: 16.0),
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            backgroundColor: currentMenuInfo.menuType == value.menuType
                ? CustomColors.menuBackgroundColor
                : Colors.transparent,
          ),
          child: Column(
            children: <Widget>[
              Image.asset(currentMenuInfo.imageSource, scale: 1.5),
              SizedBox(height: 16),
              Text(currentMenuInfo.title,
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, fontFamily: 'avenir'))
            ],
          ),
        );
      },
    );
  }
}
