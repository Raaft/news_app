import 'dart:math';

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/api/authers_api.dart';
import 'package:news_app/api/post_api.dart';
import 'package:news_app/models/post_model.dart';
import 'package:news_app/screens/single_post_screen.dart';
import 'dart:async';
import 'package:timeago/timeago.dart';
import 'package:news_app/utilits/data_messages_utilit.dart';

class WhatsNewScreen extends StatefulWidget {
  @override
  _WhatsNewScreenState createState() => _WhatsNewScreenState();
}

class _WhatsNewScreenState extends State<WhatsNewScreen> {
  PostsApi postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          newHeader(context),
          whatsNewtopStories(),
          recentUpdate(),

        ],
      ),
    );
  }

  Widget newHeader(BuildContext context) {
    return FutureBuilder(
        future: postsApi.fetchWhatsNew(),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.none:
              // TODO handle problem
              return connectionError();
              break;
            case ConnectionState.done:
              if (snapShot.error != null) {
                // TODO handle Error
                return error(snapShot.error);
              } else {
                if (snapShot.hasData) {
                  List<Post> posts = snapShot.data;
                  Random random = Random();
                  int randomIndex = random.nextInt(posts.length);
                  Post post = posts[randomIndex];

                  return Container(
                    padding: EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(post.urlToImage))),
                    child: Column(
                      children: [
                        whatsNewHeader(post),
                      ],
                    ),
                  );
                } else {
                  //TODO : handle No Data
                  return noData();
                }
              }
              break;
          }
          return Container();
        });
  }

  Widget whatsNewHeader(Post post) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SinglePostScreen(post);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              post.title,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.red.shade900),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                post.description,
                maxLines: 5,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Colors.blueGrey.withOpacity(.5)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget whatsNewtopStories() {
    return Container(
      child: FutureBuilder(
        future: postsApi.fetchWhatsNew(),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.none:
              // TODO handle problem
              return connectionError();
              break;
            case ConnectionState.done:
              if (snapShot.error != null) {
                // TODO handle Error
                return error(snapShot.error);
              } else {
                if (snapShot.hasData) {
                  List<Post> posts = snapShot.data;
                  if (posts.length >= 3) {
                    Post post1 = snapShot.data[0];
                    Post post2 = snapShot.data[1];
                    Post post3 = snapShot.data[2];
                    return Column(
                      children: <Widget>[
                        singleStory(post1),
                        Divider(),
                        singleStory(post2),
                        Divider(),
                        singleStory(post3),
                      ],
                    );
                  } else {
                    return noData();
                  }
                } else {
                  //TODO : handle No Data
                  return noData();
                }
              }
              break;
          }
          return Container();
        },
      ),
    );
  }



  Widget storyTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700),
      ),
    );
  }

  Widget singleStory(Post post) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SinglePostScreen(post)));
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
                        child: Image.network(
                          post.urlToImage,
                          fit: BoxFit.cover,
                        )),
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
                                child: Text(post.author,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: Colors.red.shade300)),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer,
                                      color: Colors.grey, size: 12),
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

  Widget recentUpdate() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
          future: postsApi.fetchWhatsNew(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return connectionError();
                break;
              case ConnectionState.active:
                return loading();
                break;
              case ConnectionState.waiting:
                return loading();
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return error(snapshot.error);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                        child: storyTitle('Recent Update'),
                      ),
                      _drawRecentUpdateCard(
                          Colors.deepOrange, snapshot.data[0]),
                      _drawRecentUpdateCard(Colors.teal, snapshot.data[1]),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  );
                }
                break;
            }
            return Container();
          }),
    );
  }

  Widget _drawRecentUpdateCard(Color color, Post post) {
    return Card(
        child: GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SinglePostScreen(post);
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(post.urlToImage), fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 2,
                bottom: 2,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'SPORT',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Text(
              post.title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 16,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  publishedTime(post.publishedAt),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
