import 'package:asmr_application/auth/loading.dart';
import 'package:flutter/material.dart';

import 'auth/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,appBarTheme:const AppBarTheme(color: Colors.blue)),
      home:const Loading()

    );
  }
}


