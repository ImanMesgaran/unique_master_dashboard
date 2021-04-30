import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';

class CustomAppBar extends PreferredSize {
  final double height;

  CustomAppBar({this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: app_white_color,
      alignment: Alignment.centerRight,
      child: Text(
        tr('home_page.title'),
        style: gray__24__400,
      ),
    );
  }
}
