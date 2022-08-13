import 'package:flutter/material.dart';
import 'package:newsapp_project/models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article article;
  const NewsDetailsScreen({Key? key, required this.article}) : super(key: key);

  getDate(String v) {
    final endIndex = v.indexOf("T", 0);
    return v.substring(0, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.screen),
                image: NetworkImage(article.urlToImage!),
                fit: BoxFit.cover,
              )),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xff000000).withOpacity(1),
                        const Color(0xff464646).withOpacity(0.3),
                      ]),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      article.title!,
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: const TextStyle(
                          color: Color(0xfff2f2f2),
                          fontWeight: FontWeight.bold,
                          fontSize: 29),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.source!.name!,
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          style: const TextStyle(
                              color: Color(0xfff2f2f2), fontSize: 20),
                        ),
                        Text(
                          getDate(article.publishedAt!),
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          style: const TextStyle(
                              color: Color(0xfff2f2f2), fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      article.description!,
                      overflow: TextOverflow.clip,
                      maxLines: 5,
                      style: const TextStyle(
                          color: Color(0xffbababa), fontSize: 14),
                    ),
                  ],
                ),
              )),
          Positioned(
            left: 10,
            top: 42,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
