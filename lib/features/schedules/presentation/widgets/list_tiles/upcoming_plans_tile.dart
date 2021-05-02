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
      margin: EdgeInsets.symmetric(vertical: 7.5),
      width: MediaQuery.of(context).size.width / 4,
      child: Row(
        children: [
          Flexible(
              flex: 4,
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(title, style: black__18__600))),
          SizedBox(width: 16),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: seperatorColor,
              ),
              width: 4,
              height: 35,
            ),
          ),
          SizedBox(width: 16),
          Flexible(
            flex: 7,
            child: Container(
              //width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(headerText, style: gray__16__600)),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(footerText,
                        style: gray__14__500.copyWith(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
