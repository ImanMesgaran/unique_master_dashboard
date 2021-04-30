import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';

class DrawerListTile extends StatelessWidget {
  final int id;
  final String text;
  final Function onTap;
  final bool isSelected;

  DrawerListTile({
    Key key,
    @required this.id,
    @required this.text,
    @required this.onTap,
    @required this.isSelected,
  }) : super(key: key);

  // final Shader linearGradient = LinearGradient(
  //   colors: <Color>[app_light_purple_two_color, app_light_purple_three_color],
  // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(id);
      },
      child: Container(
        height: 54,
        width: 260,
        child: Text(text, style: gray__16__400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? app_light_purple_one_color : app_white_color,
        ),

        //selectedTileColor: app_light_purple_color,
      ),
    );
  }
}
