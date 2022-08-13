import 'package:flutter/material.dart';
import 'package:newsapp_project/models/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> articles = [];
  bool _isLoading = true;
  bool get isLoading => _isLoading;
}
