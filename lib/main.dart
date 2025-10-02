import 'package:flutter/material.dart';
import 'package:latkuis_124230037/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Kuis',
      theme: ThemeData(
          primaryColor: const Color(0xFFD7263D), 
          scaffoldBackgroundColor: const Color(0xFF02182B), 
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFFD7263D)), 
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF02182B), 
          ),
        ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

