import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp_project/provider/internet_provider.dart';
import 'package:newsapp_project/provider/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:newsapp_project/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => InternetProvider()),
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // adding google robo slab
            textTheme: GoogleFonts.robotoSlabTextTheme(ThemeData().textTheme),
            scaffoldBackgroundColor: const Color(0xff464646)),
      ),
    );
  }
}
