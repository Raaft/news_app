import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

import 'home_tabs/favorite_screen.dart';
import 'home_tabs/popular_screen.dart';

class HeadLineNewsScreen extends StatefulWidget {
  const HeadLineNewsScreen({Key key}) : super(key: key);

  @override
  _HeadLineNewsScreenState createState() => _HeadLineNewsScreenState();
}

class _HeadLineNewsScreenState extends State<HeadLineNewsScreen>
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
        title: Text('HeadLine News'),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
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
          FavoriteScreen(),
          PopularScreen(),
          FavoriteScreen(),
        ],
      )),
    );
  }
}
