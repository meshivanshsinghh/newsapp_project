import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_project/models/news_model.dart';
import 'package:newsapp_project/screens/news_details_screen.dart';

class NewsList extends StatefulWidget {
  final List<Article> articles;
  const NewsList({Key? key, required this.articles}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  getDate(String v) {
    final endIndex = v.indexOf("T", 0);
    return v.substring(0, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 5),
      child: ListView.builder(
        itemCount: widget.articles.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(
                            article: widget.articles[index],
                          )));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: widget.articles[index].urlToImage != null
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.overlay),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                height: 250,
                                width: double.infinity,
                                imageUrl: widget.articles[index].urlToImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 130,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      const Color(0xff000000).withOpacity(0.5),
                                      const Color(0xff464646).withOpacity(0.04),
                                    ]),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 7,
                                      color: Colors.black54,
                                      spreadRadius: 1,
                                      offset: Offset(0, 4))
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.articles[index].title!,
                                    overflow: TextOverflow.clip,
                                    maxLines: 3,
                                    style: const TextStyle(
                                        color: Color(0xfff2f2f2),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.articles[index].source!.name!,
                                        style: const TextStyle(
                                            color: Color(0xffbababa),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      Text(
                                        getDate(widget
                                            .articles[index].publishedAt!),
                                        style: const TextStyle(
                                            color: Color(0xffbababa),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : null,
            ),
          );
        }),
      ),
    );
  }
}
