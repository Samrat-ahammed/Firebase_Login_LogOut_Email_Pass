// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_email/Login_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  void singOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => Login_Page(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  singOut();
                },
                child: const Text("LogOut"),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: Colors.green,
          ),
          Container(
            height: 100,
            color: Colors.pink,
          ),
          Container(
            height: 100,
            color: Colors.purple,
          ),
          Container(
            height: 100,
            color: Colors.brown,
          ),
          Container(
            height: 100,
            color: Colors.yellow,
          ),
        ],
      )),
    );
  }
}
