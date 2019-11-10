import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demodom/models/news_model.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String uri =
      "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-10&sortBy=publishedAt&apiKey=4282d0b762a34765a73cc43ffb68c4eb";

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(uri);
    print(response.body);
    return allArticlesFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
