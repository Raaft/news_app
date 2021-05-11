import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/nav_munu.dart';
import 'package:news_app/screens/facebook_feeds_screen.dart';
import 'package:news_app/screens/headline_news_screen.dart';
import 'package:news_app/screens/home_Screen.dart';
import 'package:news_app/screens/pages/login_screen.dart';
import 'package:news_app/screens/twitter_feed_screen.dart';
import 'package:news_app/screens/instgram_feed_screen.dart';
import 'package:news_app/utilits/app_utiltis.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool isLoggedIn = false;
  List<NavMenuItems> navigationMenu = [
    NavMenuItems("Explore", () => HomePage()),
    NavMenuItems("HeadLine News", () => HeadLineNewsScreen()),
    NavMenuItems("Twitter Feeds", () => TwitterFeeds()),
    NavMenuItems("Instagram Feeds", () => InstagramFeedsScreen()),
    NavMenuItems("FaceBook Feeds", () => FaceBookFeedsScreen()),
    NavMenuItems("Login", () => LogInScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 10),
        child: ListView.builder(
            itemCount: navigationMenu.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      navigationMenu[index].title,
                      style:
                          TextStyle(fontSize: 22, color: Colors.grey.shade700),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  navigationMenu[index].destination()));
                    },
                  ),
                )),
      ),
    );
  }
}
