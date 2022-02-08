import 'package:flutter/material.dart';
import 'package:login_with_google/src/pages/login.dart';

import 'src/pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Google Sign In',
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
    ),
  );
}
