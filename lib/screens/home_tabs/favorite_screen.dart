import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Card(
            child: Container(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  headFavorite(),
                  SizedBox(height: 17),
                  bodyFavorite(),
                ]))));
  }

  Row headFavorite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          CircleAvatar(backgroundImage: ExactAssetImage("assets/images/1.jpg")),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text("Raaft Husseny",
                  style: TextStyle(
                      color: Colors.red.shade900, fontWeight: FontWeight.w500,fontSize: 16)),
              SizedBox(height: 10),
              Row(children: [
                Text("15 min",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w300)),
                SizedBox(
                  width: 10,
                ),
                Text("Life Style",
                    style: TextStyle(color: Colors.red.shade900)),
              ])
            ],
          )
        ]),
        IconButton(
            icon: Icon(Icons.bookmark_border, color: Colors.grey),
            onPressed: () {})
      ],
    );
  }

  Row bodyFavorite() {
    return Row(
      children: [
        Container(
            height: 125,
            width: 125,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/1.jpg'),
                    fit: BoxFit.cover))),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              Text(
                "Other countries are restarting travel, so should we",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black87),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text(
                "'What we can't have is a repeat of last summer, where the lists were chopping and changing on a daily or even weekly basis.",
                style:
                    TextStyle(height: 1.25, fontSize: 16, color: Colors.grey),
                maxLines: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
