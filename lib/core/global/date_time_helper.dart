import 'dart:ui';

import 'package:intl/intl.dart';

String getCurrentDate({String locale}) {
  if (locale == null) locale = "en_US";
  var now = new DateTime.now();

  // var formatter = new DateFormat('dd MMMM yyyy - HH:mm:ss', locale);
  final formatter = new DateFormat('MMMM', locale);
  final formatterDay = DateFormat('dd', 'en_US');
  final formatterYear = DateFormat('yyyy', 'en_US');
  var formattern = new DateFormat('HH:mm:ss', 'en_US');
  String formattedDate = formatter.format(now);
  String formattedDay = formatterDay.format(now);
  String formattedYear = formatterYear.format(now);
  String formattedTime = formattern.format(now);
  return '$formattedDay $formattedDate $formattedYear - $formattedTime';
}

String getCurrentDateByServerFormat() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

DateTime getServerDateFormat(String date, {String locale}) {
  if (locale == null) locale = "en_US";
  return DateFormat("yyyy-MM-dd").parse(date);
}

String getCurrentDateByFormat(String format) {
  var now = new DateTime.now();
  var formatter = new DateFormat(format);
  String formattedDate = formatter.format(now);
  return formattedDate;
}

String getServerDateByFormat(String date, String format, {String locale}) {
  if (locale == null) locale = "en_US";
  var d = new DateFormat("yyyy-MM-dd").parse(date);
  var formatter = new DateFormat(format, locale);
  String formattedDate = formatter.format(d);
  return formattedDate;
}

String getCurrentYear() {
  var now = new DateTime.now();
  return now.year.toString();
}

int getCurrentYearInt() {
  var now = new DateTime.now();
  return now.year;
}

int getCurrentMonthIndex() {
  var now = new DateTime.now();
  return now.month;
}

bool isTodayByServerFormat(String date) {
  String now = getCurrentDateByServerFormat();
  if (date == now) {
    return true;
  }
  return false;
}

int getTimeDifferenceFromNow(String time) {
  var now = new DateTime.now();
  DateTime dateTimeCreatedAt = convertTimeStampToCurrentLocale(time);
  return now.difference(dateTimeCreatedAt).inHours;
}

String convertDateTimeToCurrentLocale(String time) {
  return DateFormat('yyyy-MM-dd HH:mm:ss')
      .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(time, true).toLocal());
}

DateTime convertTimeStampToCurrentLocale(String timeStamp) {
  return DateTime.parse(timeStamp).toLocal();
}

String timeStampToType10(String timeStamp) {
  var formatter = new DateFormat('dd/MM/yyyy - HH:mm');
  String formattedDate =
      formatter.format(convertTimeStampToCurrentLocale(timeStamp));

  return formattedDate;
}

bool isFirstTimeBeforeSecond(String first, String second) {
  int firstHour = int.parse(first.split(":")[0]);
  int firstMin = int.parse(first.split(":")[1]);

  int secondHour = int.parse(second.split(":")[0]);
  int secondMin = int.parse(second.split(":")[1]);

  int firstTimeToMin = ((firstHour * 60) + firstMin);
  int secondTimeToMin = ((secondHour * 60) + secondMin);

  return firstTimeToMin > secondTimeToMin;
}
