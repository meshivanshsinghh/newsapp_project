import 'package:flutter/material.dart';
import 'package:newsapp_project/models/news_model.dart';

class NewsList extends StatefulWidget {
  final List<Article> articles;
  const NewsList({Key? key, required this.articles}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.articles.length,
      itemBuilder: ((context, index) {
        return Text(widget.articles[index].title!);
      }),
    );
  }
}
