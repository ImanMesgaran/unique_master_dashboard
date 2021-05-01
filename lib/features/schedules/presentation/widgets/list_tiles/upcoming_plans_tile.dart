import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';

class UpCommingPlansTile extends StatelessWidget {
  final String title;
  final Color seperatorColor;
  final String headerText;
  final String footerText;

  const UpCommingPlansTile({
    Key key,
    @required this.title,
    @required this.seperatorColor,
    @required this.headerText,
    @required this.footerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: app_gray_six_color,
      ),
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      child: Row(
        children: [
          Text(title, style: black__18__600),
          SizedBox(
            width: 16,
          ),
          VerticalDivider(
            color: seperatorColor,
            width: 4,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Text(title, style: gray__16__600),
              Text(title, style: gray__14__500),
            ],
          ),
        ],
      ),
    );
  }
}
