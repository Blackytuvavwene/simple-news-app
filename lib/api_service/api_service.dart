import 'dart:convert';
import 'package:http/http.dart';
import 'package:simple_news_app/api_key.dart';
import 'package:simple_news_app/articles_model.dart';

class ApiService {
  var endPointUrl = Uri.parse(
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$APIKey"); //enter your own API key

  Future<List<ArticlesModel>> getArticles() async {
    var newsModel = null;
    {
      Response response = await get(endPointUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<ArticlesModel>? newsModel = body
            .map(
              (dynamic item) => ArticlesModel.fromJson(item),
            )
            .toList();
        return newsModel;
      }
    }
    return newsModel;
  }
}
