import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/utilits/api_utilies.dart';
import 'package:news_app/models/category_model.dart';


class CategoriesAPI {
  Future<List<Category>> fetchCategories() async {
    List<Category> Categories = List<Category>();
    Uri url = Uri.parse(base_api + all_categories_api);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["articles"];
      for (var item in data) {
        Category category =
            Category(item['id'].toString(), item['title'].toString());
        Categories.add(category);

      }
    }
    return Categories;
  }
}
