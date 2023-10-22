import 'package:flutter/material.dart';

import 'pages/login.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 149, 233, 177),
        ),
      ),
      home: const Login(),
    );
  }
}
