import 'package:designing/homepage.dart';
import 'package:designing/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void saveValues(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email.text);
    prefs.setString("password", password.text);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Homepage()));
  }

  void onPressed(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Register()));
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 330,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(75),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.deepOrangeAccent, Colors.orangeAccent])),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, top: 4),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextField(
                            controller: email,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.email),
                                hintText: "Email"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 350,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, top: 4),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextField(
                            controller: password,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.key),
                                hintText: "password"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "forget password?",
                        style: TextStyle(color: Colors.black38),
                      )))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.deepOrangeAccent, Colors.orangeAccent])),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, elevation: 0),
                onPressed: () {
                  saveValues(context);
                },
                child: const Text(
                  "LOGIN",
                )),
          ),
          const SizedBox(
            height: 160,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Row(
                children: [
                  const Text(
                    "Don't have a account?",
                    style: TextStyle(color: Colors.black38),
                  ),
                  TextButton(
                      onPressed: () {
                        onPressed(context);
                      },
                      child: const Text("Register",
                          style: TextStyle(color: Colors.deepOrangeAccent)))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
