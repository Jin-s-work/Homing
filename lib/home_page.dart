import 'package:flutter/material.dart';
import 'colors.dart';
import 'register_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 173),
            Image.asset('assets/logo.png', width: 172, height: 230),
            SizedBox(height: 216),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackButton,
                foregroundColor: Colors.grey[50],
                minimumSize: Size(344, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // 로그인 버튼 눌렀을 때의 동작
              },
              child: Text(
                '로그인',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'AppleSDGothicNeo',
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greyButton,
                foregroundColor: Colors.black,
                minimumSize: Size(344, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = Offset(1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'AppleSDGothicNeo',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
