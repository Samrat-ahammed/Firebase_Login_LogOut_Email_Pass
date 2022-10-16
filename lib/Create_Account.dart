import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_email/HomePage.dart';
import 'package:firebase_auth_email/Login_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Create_Accoun extends StatefulWidget {
  const Create_Accoun({super.key});

  @override
  State<Create_Accoun> createState() => _Create_AccounState();
}

class _Create_AccounState extends State<Create_Accoun> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void creAccount() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String cpassword = cPasswordController.text.trim();
    if (email == "" || password == "" || cpassword == "") {
      log("Please fill in gaps");
    } else if (password != cpassword) {
      log("Password dos not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => Login_Page(),
              ));
        }
      } on FirebaseAuthException catch (e) {
        log(e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: cPasswordController,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  creAccount();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const Spacer(),
          const Spacer(),
        ],
      )),
    );
  }
}
