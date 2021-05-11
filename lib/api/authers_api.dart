import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilits/api_utilies.dart';
import 'package:news_app/models/authers_model.dart';

class AuthorsApi {
  Future<List<Author>> fetchAllAuthors() async {
    List<Author> authors = List<Author>();
    Uri url = Uri.parse(base_api + all_authors_api);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];

      for (var item in data) {
        Author author =Author(
            item['title'].toString(),
            item['description'].toString(),
            item['publishedAt'].toString(),
            item['urlToImage'].toString() ,
            item['author'].toString());
        authors.add(author);
      }
    }
    return authors;
  }
}
