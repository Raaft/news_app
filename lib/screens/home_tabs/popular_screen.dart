import 'package:flutter/material.dart';
import 'package:news_app/api/post_api.dart';
import 'package:news_app/models/post_model.dart';
import 'package:news_app/screens/home_tabs/whatsNew_screen.dart';
import 'package:news_app/utilits/data_messages_utilit.dart';

import '../single_post_screen.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  var postApi = PostsApi();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postApi.fetchrecentUpdate(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return error(snapshot.error);
            } else {
              List<Post> posts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: singleStory(posts[index]),
                  );
                },
                itemCount: posts.length,
              );
            }
            break;
        }
        return ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: (null),
            );
          },
          itemCount: 20,
        );
      },
    );
  }

  Widget singleStory(Post post) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SinglePostScreen(post);
          }));
        },
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    SizedBox(
                        height: 115,
                        width: 115,
                        child: Image.network(post.urlToImage,fit: BoxFit.cover,)),
                    SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            post.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade700,
                                fontSize: 20),
                            maxLines: 2,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(post.author==null?"":post.author,maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                        color: Colors.red.shade300)),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer, color: Colors.grey, size: 11),
                                  Text(publishedTime(post.publishedAt),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
