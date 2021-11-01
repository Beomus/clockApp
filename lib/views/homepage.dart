// ignore_for_file: prefer_const_constructors

import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/menu_info.dart';
import 'package:clock_app/views/clock_view.dart';
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
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

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
              if (value.menuType != MenuType.clock) return Container();

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text('Clock',
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24)),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(formattedTime,
                              style: TextStyle(
                                  fontFamily: 'avenir',
                                  color: Colors.white,
                                  fontSize: 64)),
                          Text(formattedDate,
                              style: TextStyle(
                                  fontFamily: 'avenir',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.center,
                            child: ClockView(
                                size: MediaQuery.of(context).size.height / 3))),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Timezone',
                              style: TextStyle(
                                  fontFamily: 'avenir',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24)),
                          SizedBox(height: 16),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                              SizedBox(width: 16),
                              Text('UTC' + offsetSign + timezoneString,
                                  style: TextStyle(
                                      fontFamily: 'avenir',
                                      color: Colors.white,
                                      fontSize: 24))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
