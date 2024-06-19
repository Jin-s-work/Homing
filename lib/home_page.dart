import 'package:flutter/material.dart';
import 'colors.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 173),
            Image.asset('assets/logo.png', width: 172, height: 230), // 로고 이미지
            SizedBox(height: 216),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackButton, // 버튼 배경색
                foregroundColor: Colors.grey[50],
                minimumSize: Size(344, 56), // 버튼 크기
                shape: RoundedRectangleBorder( // 둥근 직사각형 모양
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
                  fontFamily: 'AppleSDGothicNeo', // 폰트 설정
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greyButton, // 버튼 배경색
                foregroundColor: Colors.black, // 텍스트 색상
                minimumSize: Size(344, 56), // 버튼 크기
                shape: RoundedRectangleBorder( // 둥근 직사각형 모양
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                // 회원가입 버튼 눌렀을 때의 동작
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'AppleSDGothicNeo', // 폰트 설정
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
