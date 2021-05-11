import 'package:http/http.dart' as http;
import 'package:news_app/models/post_model.dart';
import 'package:news_app/utilits/api_utilies.dart';
import 'dart:convert';

class PostsApi {
  Future<List<Post>> fetchWhatsNew() async {
    List<Post> posts = List<Post>();
    Uri whatsNewApi = Uri.parse(base_api + all_authors_api);
    var response = await http.get(whatsNewApi);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];
      for (var item in data) {
        Post post = Post(
          title: item['title'].toString(),
          description: item['description'].toString(),
          publishedAt: item['publishedAt'].toString(),
          urlToImage: item['urlToImage'].toString(),
          content: item['content'].toString(),
          //  author: ( item['author'] == null ) ? List<int>() : jsonDecode(item['author']),
          author: item['author'].toString(),
        );
        posts.add(post);
      }
    }
    return posts;
  }

  Future<List<Post>> fetchrecentUpdate() async {
    List<Post> posts = List<Post>();
    Uri whatsNewApi = Uri.parse(base_api + all_categories_api);
    var response = await http.get(whatsNewApi);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];
      for (var item in data) {
        Post post = Post(
          title: item['title'].toString(),
          description: item['description'].toString(),
          publishedAt: item['publishedAt'].toString(),
          urlToImage: item['urlToImage'].toString(),
          content: item['content'].toString(),
          // author: ( item['author'] == null ) ? List<int>() : jsonDecode(item['author'])
          author: item['author'].toString(),
        );
        posts.add(post);
      }
    }
    return posts;
  }

  Future<List<Post>> fetchPopular() async {
    List<Post> posts = List<Post>();
    Uri whatsNewApi = Uri.parse(base_api + popular_posts_api);
    var response = await http.get(whatsNewApi);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];
      for (var item in data) {
        Post post = Post(
          title: item['title'].toString(),
          description: item['description'].toString(),
          publishedAt: item['publishedAt'].toString(),
          urlToImage: item['urlToImage'].toString(),
          content: item['content'].toString(),
          // author: ( item['author'] == null ) ? List<int>() : jsonDecode(item['author'])
          author: item['author'].toString(),
        );
        posts.add(post);
      }
    }
    return posts;
  }
}
