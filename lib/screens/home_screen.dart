import 'package:newsapp_project/provider/internet_provider.dart';
import 'package:newsapp_project/provider/news_provider.dart';
import 'package:newsapp_project/widgets/shimmer_layout.dart';
import 'package:newsapp_project/widgets/news_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final np = context.read<NewsProvider>();
    final ip = context.read<InternetProvider>();
    if (ip.hasInternet == true && np.firstTime == true) {
      np.getArticles();
    } else {
      np.getFromSF();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // calling our news provider
    final np = context.watch<NewsProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "HEADLINES",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4),
        ),
      ),
      body: np.isLoading == true
          ? const Center(
              child: ShimmerLoading(),
            )
          : NewsList(articles: np.articles),
    );
  }
}
