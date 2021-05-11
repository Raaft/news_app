import 'package:flutter/material.dart';
import 'package:news_app/models/post_model.dart';

class SinglePostScreen extends StatefulWidget {
  final Post post;

  SinglePostScreen(this.post);

  @override
  _SinglePostScreenState createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.post.urlToImage),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, position) {
              if (position == 0) {
                return  _drawPostDetails(); }
                else if(position == 1){
               return buildCommentText();
              } else if (position >= 2 && position < 9) {
                return _comments();
              } else if (position == 10) {
                return _commentTextEntry();
              }
              // that's local function that called as locally main function
              return _commentTextEntry();
            }, childCount: 10),
          ),
        ],
      ),
    );
  }

  Padding buildCommentText() {
    return Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Comments",textAlign: TextAlign.start,style: TextStyle(fontSize: 18,)),
              );
  }

  Widget _commentTextEntry() {
    return Column(
      children: [
        Row(children: [
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: " Enter Your Comment",
                    border: InputBorder.none,
                    hintText: " Enter Your Comment")),
          )),
          FlatButton(onPressed: () {}, child: Text("Send")),
          SizedBox(height: 20)
        ]),
      ],
    );
  }

  Widget _comments() {
    return Padding(
      padding: EdgeInsets.only(top: 3,bottom: 3,right: 8,left: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
            padding: EdgeInsets.only(top:8,bottom: 6,right: 8,left: 8),
           // height: 100,

            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(maxRadius: 30,minRadius: 30,),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red.shade900)),
                        SizedBox(height: 8),
                        Text("1 hour",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey.shade700))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12),
                Text(
                    "This is the user comment This is the user comment This is the user comment",
                    style: TextStyle( fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(widget.post.description,style: TextStyle(fontSize: 20, color: Colors.grey.shade900,fontWeight: FontWeight.w300),),
    );
  }
}
