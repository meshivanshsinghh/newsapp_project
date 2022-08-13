import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_project/models/news_model.dart';
import 'package:newsapp_project/utils/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> articles = [];
  bool _isLoading = true;
  bool _firstTime = true;

  bool get firstTime => _firstTime;
  bool get isLoading => _isLoading;

  Future getArticles() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await http.get(Uri.parse(ApiConfig.apiUrl));

    final newsResponse = NewsModel.fromJson(jsonDecode(response.body));
    String data = jsonEncode(newsResponse);
    sharedPreferences.setString("articlesData", data);
    articles.addAll(newsResponse.articles);
    _isLoading = false;
    _firstTime = false;
    notifyListeners();
  }

  Future getFromSF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = NewsModel.fromJson(
        jsonDecode(sharedPreferences.getString("articlesData")!));
    articles.addAll(response.articles);
    _isLoading = false;
    notifyListeners();
  }
}
