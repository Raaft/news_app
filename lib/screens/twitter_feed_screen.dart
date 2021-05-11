import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:date_format/date_format.dart';

class TwitterFeeds extends StatefulWidget {
  const TwitterFeeds({Key key}) : super(key: key);

  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  var time =
      formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ' ', am]).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feeds"),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    _cardHead(),
                    _cardBody(),
                    Divider(),
                    _cardFooter()
                  ],
                ),
              ),
            );
          }),
      drawer: NavigationDrawer(),
    );
  }

  Widget _cardHead() {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            backgroundImage: ExactAssetImage("assets/images/1.jpg")),
      ),
      Column(
        children: [
          Row(
            children: [Text("Raaft Hesseny"), Text("@raafth")],
          ),
          SizedBox(height: 10),
          Text(time)
        ],
      )
    ]);
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          "Two Royal Navy ships send French fishermen scurrying back home after one of them RAMS a British boat"),
    );
  }

  Widget _cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: Colors.orange,
                ),
                onPressed: () {}),
            Text(" 25")
          ],
        ),
        Row(
          children: [
            FlatButton(
                onPressed: () {},
                child: Text(
                  "share",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "open",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
