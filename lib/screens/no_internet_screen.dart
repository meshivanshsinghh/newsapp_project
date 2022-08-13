import 'package:flutter/material.dart';
import 'package:newsapp_project/provider/internet_provider.dart';
import 'package:newsapp_project/screens/home_screen.dart';

import 'package:provider/provider.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  _NoInternetPageState createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    final internetbloc = context.watch<InternetProvider>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.network_check,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            const Text("No Internet Connection!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            const Text("Enable your wifi/mobile data",
                style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  internetbloc.checkInternet().whenComplete(() =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const HomeScreen()))));
                },
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text("Check Again",
                    style: TextStyle(color: Colors.white, fontSize: 16))),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomeScreen())));
                },
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text("Load Saved Data",
                    style: TextStyle(color: Colors.white, fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
