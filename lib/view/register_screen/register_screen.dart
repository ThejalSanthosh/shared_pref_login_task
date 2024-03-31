import 'package:flutter/material.dart';
import 'package:shared_pref_login_task/view/home_screen/home_screen.dart';
import 'package:shared_pref_login_task/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

    TextEditingController emailController1 = TextEditingController();

    TextEditingController passwordController2 = TextEditingController();

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
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJSD810ZWQb1zaelTMKfdCoBl0FMAs15VUtuNe9H_1kNiiEEWcRPqiFxIKyYlVCUsZw_s&usqp=CAU"))),
                  ),
                  TextFormField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      hintText: "Enter your First Name",
                      labelText: "First Name",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 169, 58, 228),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First Name is Empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      hintText: "Enter your Last Name",
                      labelText: "Last Name",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 169, 58, 228),
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last Name is Empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController1,
                    decoration: const InputDecoration(
                      hintText: "Enter your UserName/Email",
                      labelText: "UserName/Email",
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
                    controller: passwordController2,
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
                      if (passwordController2.text.isEmpty) {
                        return "Password is Empty";
                      } else if (passwordController2.text.length < 6) {
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
                          await prefs.setString('email', emailController1.text);
                          await prefs.setString(
                              'password', passwordController2.text);

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Register Success'),
                                content: Text('Registeration successfully'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        )),
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      icon: Icon(Icons.login),
                      label: Text(
                        "REGISTER",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
