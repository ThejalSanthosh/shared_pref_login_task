import 'package:flutter/material.dart';
import 'package:shared_pref_login_task/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Welcome Back ",
        style: TextStyle(color: Colors.black, fontSize: 24),
      )),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) async {
            index == value;
            if (value == 1) {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.setBool("isLoggedIn", false);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
              setState(() {});
            }
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout")
          ]),
    );
  }
}
