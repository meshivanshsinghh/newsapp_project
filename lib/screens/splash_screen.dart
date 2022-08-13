import 'dart:async';

import 'package:newsapp_project/provider/internet_provider.dart';
import 'package:newsapp_project/screens/home_screen.dart';
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
    final ip = context.read<InternetProvider>();
    super.initState();
    // timer
    Timer(const Duration(seconds: 2), () {
      ip.hasInternet == true
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("SPLASHSCREEN")),
    );
  }
}
