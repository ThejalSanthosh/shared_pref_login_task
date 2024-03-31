import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_login_task/view/home_screen/home_screen.dart';
import 'package:shared_pref_login_task/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreem extends StatefulWidget {
  const SplashScreem({super.key});

  @override
  State<SplashScreem> createState() => _SplashScreemState();
}


 
class _SplashScreemState extends State<SplashScreem> {
 
 @override
  void initState() {

   Timer(Duration(seconds: 3), () async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isLoggedIn = await preferences.getBool("isLoggedIn");


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>isLoggedIn==true?HomeScreen(): LoginScreen(),));

    });

    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body: Center(child: Image.network("https://lh3.googleusercontent.com/nmDv7SN0b6bWFpFG9Xp5U5givjep7dffMtfpYN4LUK5k3wS-YtZXrLrxg1JI_VxrejGXKrTKSMtiHed0Ihzvc6RfuZMWKCl2c4AyZocYcAreGIN-3SCDc2vSw2-UijZzkMyAbwLv")),
    );
  }
}