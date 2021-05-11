import 'package:flutter/material.dart';

Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("Connection Error"),
  );
}
Widget error(error) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Text(error.toString()),
  );
}
Widget loading() {
  return Container(child: Center(child: CircularProgressIndicator()));
}
Widget noData() {
  return Container(
    child: Text("No Data"),
  );
}
publishedTime(String timePublished){
  Duration timeAgo =
  DateTime.now().difference(DateTime.parse(timePublished));
  String time = " ${timeAgo.inHours}:${timeAgo.inMinutes % 60} hours ago";
  return time;
}