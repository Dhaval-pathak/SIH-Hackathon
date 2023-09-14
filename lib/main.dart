import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/theme/colors.dart';
import 'package:flutter/material.dart';
import 'logins/signin_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: Home(),
    );
  }
}
