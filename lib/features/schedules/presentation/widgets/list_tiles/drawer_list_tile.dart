import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';

class DrawerListTile extends StatelessWidget {
  final int id;
  final String text;
  final String icon;
  final Function onTap;
  final bool isSelected;

  DrawerListTile({
    Key key,
    @required this.id,
    @required this.text,
    @required this.icon,
    @required this.onTap,
    @required this.isSelected,
  }) : super(key: key);

  final Shader linearGradient = LinearGradient(
    colors: <Color>[app_light_purple_two_color, app_light_purple_three_color],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(id);
      },
      child: Container(
        height: 54,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            if (isSelected)
              Image.asset(
                icon,
                width: 24,
                height: 24,
                colorBlendMode: BlendMode.difference,
                color: app_light_purple_one_color,
              ),
            if (!isSelected)
              Image.asset(
                icon,
                width: 24,
                height: 24,
              ),
            SizedBox(width: 20),
            Text(text,
                style: isSelected
                    ? gray__16__400.copyWith(
                        foreground: Paint()..shader = linearGradient,
                      )
                    : gray__16__400),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? app_light_purple_one_color : Colors.transparent,
        ),
      ),
    );
  }
}
