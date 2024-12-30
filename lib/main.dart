import 'package:flutter/material.dart';
import 'package:ftfl_attendance_web/screen_view/auth/login_screen.dart';
import 'package:ftfl_attendance_web/screen_view/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
