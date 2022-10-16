import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_email/Create_Account.dart';
import 'package:firebase_auth_email/HomePage.dart';
import 'package:firebase_auth_email/Login_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        primarySwatch: Colors.blue,
      ),
      home: (FirebaseAuth.instance.currentUser != null)
          ? Home_Page()
          : Login_Page(),
    );
  }
}
