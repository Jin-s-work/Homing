import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'login_page.dart';
import 'tab_navigation.dart'; // TabNavigation 임포트
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
        '/login': (context) => LoginPage(),
        '/list': (context) => TabNavigation(),
      },
    );
  }
}
