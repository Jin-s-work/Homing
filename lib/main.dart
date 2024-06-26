import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homing App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteBackground,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.whiteBackground,
        ),
      ),
      home: HomePage(),
      routes: {
        '/register': (context) => RegisterPage(),
      },

    );
  }
}
