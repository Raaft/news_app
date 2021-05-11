import 'package:flutter/material.dart';
import 'package:news_app/screens/home_Screen.dart';
import 'package:news_app/screens/welcom_escreen.dart';
import 'package:news_app/utilits/app_them.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool seen = preferences.getBool('seen');
  Widget _screen = WelcomeScreen();
  if (seen != null && seen) {
    _screen = HomePage();
  }

  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: _screen,
    );
  }
}
