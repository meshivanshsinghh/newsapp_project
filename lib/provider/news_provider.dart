import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_project/models/news_model.dart';
import 'package:newsapp_project/utils/api_config.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> articles = [];
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  NewsProvider() {
    getArticles();
  }

  Future getArticles() async {
    final response = await http.get(Uri.parse(ApiConfig.apiUrl));
    final newsResponse = NewsModel.fromJson(jsonDecode(response.body));
    articles.addAll(newsResponse.articles);
    _isLoading = false;
    notifyListeners();
  }
}
