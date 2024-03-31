import 'package:flutter/material.dart';
import 'package:shared_pref_login_task/view/home_screen/home_screen.dart';
import 'package:shared_pref_login_task/view/register_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController1 = TextEditingController();

    TextEditingController nameController2 = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/purple-fluid-background_53876-99561.jpg?w=360&t=st=1708179892~exp=1708180492~hmac=bf2ab436e04f18843326756b2969bb275da31f4bfe42bf68ba5fcec9a378acd5"),
                fit: BoxFit.fill)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.booking-manager.com/tmp/clients/featured-partners/LogIN/facts/1579099736000_loginlogo_-1.webp"))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController1,
                    decoration: const InputDecoration(
                      hintText: "Enter your UserName",
                      labelText: "UserName",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 169, 58, 228),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "UserName is Empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController2,
                    decoration: const InputDecoration(
                      hintText: "Enter your Password",
                      labelText: "Password",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 169, 58, 228),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                    validator: (value) {
                      if (nameController2.text.isEmpty) {
                        return "Password is Empty";
                      } else if (nameController2.text.length < 6) {
                        return "Password should contain more than 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? savedEmail = prefs.getString('email');
                          String? savedPassword = prefs.getString('password');

                          String enteredEmail = nameController1.text;
                          String enteredPassword = nameController2.text;

                          if (savedEmail == enteredEmail &&
                              savedPassword == enteredPassword) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Login Successful'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              )),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Login Failed'),
                                  content: Text(
                                      'Invalid email or password. Please try again.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      icon: Icon(Icons.login),
                      label: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Text(
                        "Not Registered?",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ));
                          },
                          child: Text("SignUp"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
