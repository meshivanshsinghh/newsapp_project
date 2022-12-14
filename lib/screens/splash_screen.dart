import 'dart:async';

import 'package:newsapp_project/provider/internet_provider.dart';
import 'package:newsapp_project/screens/home_screen.dart';
import 'package:newsapp_project/screens/no_internet_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInternetState();
    super.initState();
  }

  // checking the internet state
  getInternetState() async {
    final ip = context.read<InternetProvider>();
    await ip.checkInternet().whenComplete(() {
      Timer(const Duration(seconds: 2), () {
        ip.hasInternet == true
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const NoInternetPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/logo.png",
        height: 80,
        width: 80,
      )),
    );
  }
}
