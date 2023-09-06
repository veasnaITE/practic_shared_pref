import 'package:first_launch/home_screen.dart';
import 'package:first_launch/splash_screeen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool newLaunch = false;

  void _loadNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    newLaunch = prefs.getBool('new')??true;
    setState(() {
      print(newLaunch);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      _loadNewLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return newLaunch ? const SplashScreen() : const HomeScreen();
  }
}
