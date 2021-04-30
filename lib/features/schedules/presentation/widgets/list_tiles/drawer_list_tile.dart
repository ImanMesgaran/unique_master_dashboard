import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';

class DrawerListTile extends StatelessWidget {
  final int id;
  final String text;
  final Function(int) onTap;
  final bool isSelected;

  const DrawerListTile({
    Key key,
    @required this.id,
    @required this.text,
    @required this.onTap,
    @required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(id),
      child: Container(
        child: Text(text, style: gray__16__400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? app_light_purple_color : app_white_color,
        ),

        //selectedTileColor: app_light_purple_color,
      ),
    );
  }
}
