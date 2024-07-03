import 'package:flutter/material.dart';
import 'colors.dart';
import 'tab_navigation.dart'; // TabNavigation 임포트

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // 로그인 로직 추가
    // 예: 입력값 유효성 검사, 서버에 데이터 전송 등
    print('로그인 시도');

    // 로그인 성공 시 TabNavigation으로 이동
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 키보드가 나타날 때 화면이 조정되도록 설정
      appBar: AppBar(
        title: Text(
          '로그인',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.whiteBackground,
        elevation: 0,
      ),
      backgroundColor: AppColors.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabelAndTextField('아이디', '예) 홍길동', _idController),
                SizedBox(height: 24),
                _buildLabelAndTextField(
                    '비밀번호', '비밀번호를 입력해주세요.', _passwordController, true),
              ],
            ),
          ),
          Spacer(), // 로그인 버튼을 하단에 고정시키기 위해 Spacer 사용
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackButton,
                  minimumSize: Size(344, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: _login,
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'AppleSDGothicNeo',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelAndTextField(String label, String hint,
      TextEditingController controller, [bool obscureText = false]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: Text(label, style: TextStyle(fontSize: 18)),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
