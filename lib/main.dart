import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const UniNexusApp());
}

class UniNexusApp extends StatelessWidget {
  const UniNexusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniNexus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Remove fontFamily if Inter is not properly configured
        // fontFamily: 'Inter',
      ),
      home: const StaffWelcomeScreen(),
      // Remove routes if not needed, or keep them simple
      // routes: {
      //   '/login': (context) => const LoginScreen(),
      //   '/welcome': (context) => const StaffWelcomeScreen(),
      // },
    );
  }
}