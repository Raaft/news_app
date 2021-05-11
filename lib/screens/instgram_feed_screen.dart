import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class InstagramFeedsScreen extends StatefulWidget {
  const InstagramFeedsScreen({Key key}) : super(key: key);

  @override
  _InstagramFeedsScreenState createState() => _InstagramFeedsScreenState();
}

class _InstagramFeedsScreenState extends State<InstagramFeedsScreen> {
  var time =
      formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ' ', am]).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Feeds"),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _instaHead(),
                    _instaTitle(),
                    _instaHashTag(),
                    _instaBody(),
                    _instaFooter(),
                  ],
                ),
              ),
            );
          }),
      drawer: NavigationDrawer(),
    );
  }

  Widget _instaHead() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
              backgroundImage: ExactAssetImage("assets/images/1.jpg")),
        ),
        Column(
          children: [
            Text("Raaft Hesseny",style: TextStyle(fontWeight: FontWeight.w600),),
            SizedBox(height: 10),
            Text(
              time,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ]),
      Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {}),
          Transform.translate(
              offset: Offset(-10, 0),
              child: Text("25",
                  style: TextStyle(
                    color: Colors.grey,
                  )))
        ],
      )
    ]);
  }

  Widget _instaTitle() {
    return Padding(
        padding: EdgeInsets.all(14),
        child: Text(
          "only hot spots on the 'green list hot spots on the green",textAlign: TextAlign.start,
        ));
  }

  Widget _instaHashTag() {
    return Container(
      child: Wrap(
        children: [
          FlatButton(
              onPressed: () {},
              child: Text("#Fotball", style: TextStyle(color: Colors.orange))),
          FlatButton(
              onPressed: () {},
              child: Text("#Arsinal", style: TextStyle(color: Colors.orange))),
          FlatButton(
              onPressed: () {},
              child: Text("#Fcb", style: TextStyle(color: Colors.orange))),
          FlatButton(
              onPressed: () {},
              child: Text("#Sun", style: TextStyle(color: Colors.orange))),
        ],
      ),
    );
  }

  Widget _instaBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.25,
      width: double.infinity,
      child: Image(image: ExactAssetImage("assets/images/2.jpg"),fit:BoxFit.cover),
    );
  }

  Widget _instaFooter() {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        FlatButton(onPressed: (){}, child: Text("10 comment",style: TextStyle(color: Colors.orange))),
        Row(children: [
          FlatButton(onPressed: (){}, child: Text("Share",style: TextStyle(color: Colors.orange))),
          FlatButton(onPressed: (){}, child: Text("Open",style: TextStyle(color: Colors.orange)))
        ],)
      ],),
    );
  }
}
