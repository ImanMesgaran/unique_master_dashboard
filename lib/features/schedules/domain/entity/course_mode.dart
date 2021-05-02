import 'package:flutter/material.dart';

class CourseModel {
  final double id;
  final String icon;
  final Color tileColor;
  final Color iconBackgroundColor;
  final String courseTitle;
  final String buttonTitle;
  final String courseType;
  final String time;

  CourseModel({
    @required this.id,
    @required this.icon,
    @required this.tileColor,
    @required this.iconBackgroundColor,
    @required this.courseTitle,
    @required this.buttonTitle,
    @required this.courseType,
    @required this.time,
  });
}
