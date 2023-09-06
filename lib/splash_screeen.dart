import 'dart:async';
import 'package:first_launch/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('new',false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        resetNewLaunch();
        return const HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen demo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text("This is the Splash Screen",
          style: TextStyle(
            color: Colors.pink,
          ),),
          Container(
          child: Image.asset('lib/images/wellcome.gif'),
          ),
        ],
      ),
    );
  }
}
