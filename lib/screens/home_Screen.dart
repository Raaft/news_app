import 'package:flutter/material.dart';
import 'package:news_app/api/authers_api.dart';
import 'package:news_app/api/post_api.dart';
import 'package:news_app/screens/home_tabs/favorite_screen.dart';
import 'package:news_app/screens/home_tabs/popular_screen.dart';
import 'package:news_app/screens/home_tabs/whatsNew_screen.dart';
import 'package:news_app/screens/pages/about.dart';
import 'package:news_app/screens/pages/contact.dart';
import 'package:news_app/screens/pages/help.dart';
import 'package:news_app/screens/pages/settings.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/api/authers_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum popMenuItems { ABOUT, CONTACT, SETTINGS, HELP }

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        title: Text('Explore'),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
          _popUpMenu(context)
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: "WHAT'S NEW"),
            Tab(text: "POPULAR"),
            Tab(text: "Favorite")
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
          child: TabBarView(
        controller: _tabController,
        children: [
          WhatsNewScreen(),
          PopularScreen(),
          FavoriteScreen(),
        ],
      )),
    );
  }

  _popUpMenu(BuildContext context) {
    return PopupMenuButton<popMenuItems>(
      itemBuilder: (Context) {
        return [
          PopupMenuItem<popMenuItems>(
            value: popMenuItems.ABOUT,
            child: Text("ABOUT"),
          ),
          PopupMenuItem<popMenuItems>(
            value: popMenuItems.CONTACT,
            child: Text("CONTACT"),
          ),
          PopupMenuItem<popMenuItems>(
            value: popMenuItems.SETTINGS,
            child: Text("SETTINGS"),
          ),
          PopupMenuItem<popMenuItems>(
            value: popMenuItems.HELP,
            child: Text("HELP"),
          ),
        ];
      },
      onSelected: (popMenuItems menu) {
        switch (menu) {
          case popMenuItems.ABOUT:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutScreen()));
            break;
          case popMenuItems.SETTINGS:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen()));
            break;

          case popMenuItems.CONTACT:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactUsScreen()));
            break;

          case popMenuItems.HELP:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpScreen()));
            break;
        }
      },
    );
  }
}
