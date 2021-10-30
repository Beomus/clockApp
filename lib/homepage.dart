// ignore_for_file: prefer_const_constructors

import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            children: <Widget>[
              buildTextButton('Clock', 'assets/clock_icon.png'),
              buildTextButton('Alarm', 'assets/alarm_icon.png'),
              buildTextButton('Timer', 'assets/timer_icon.png'),
              buildTextButton('Stopwatch', 'assets/stopwatch_icon.png'),
            ],
          ),
          VerticalDivider(color: Colors.white, width: 1),
          Expanded(
            child: Container(
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
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTextButton(String title, String image) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Image.asset(image, scale: 1.5),
            SizedBox(height: 16),
            Text(title,
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'avenir'))
          ],
        ),
      ),
    );
  }
}
