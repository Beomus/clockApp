import 'package:flutter/material.dart';

class AlarmInfo {
  String description;
  DateTime alarmDateTime;
  bool isPending;
  List<Color> gradientColors;

  AlarmInfo(this.alarmDateTime, this.description, this.isPending,
      this.gradientColors);
}
