import 'package:flutter/material.dart';
import 'colors.dart';
import 'register_page.dart';
import 'login_page.dart'; // Import login page

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
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
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
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
