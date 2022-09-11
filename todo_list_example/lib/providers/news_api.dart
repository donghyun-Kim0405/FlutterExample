import 'dart:convert';

import '../models/news.dart';
import 'package:http/http.dart' as http;

class NewsApi{
  static String apiUri = 'https://newsapi.org/v2/top-headlines?country=kr&key=';
  static String apiKey = '9a8cbf9f7a5d42cfab83d26125e58f27';

  Uri uri = Uri.parse(apiUri + apiKey);

  Future<List<News>> getNews() async{
    List<News> news = [];
    final response = await http.get(uri);
    final statusCode = response.statusCode;
    final body = response.body;

    if(statusCode == 200) {
      news = jsonDecode(body)['articles'].map<News>((article){
        return News.fromMap(article);
      }).toList();
    }

    return news;
  }
}