import 'package:flutter/material.dart';
import 'colors.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController(text: '홍길동');
  final TextEditingController _idController = TextEditingController(text: 'hgd0980');
  final TextEditingController _passwordController = TextEditingController(text: '********');
  final TextEditingController _confirmPasswordController = TextEditingController(text: '********');
  final TextEditingController _centerCodeController = TextEditingController(text: 'homing99');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '내 정보',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteBackground,
        elevation: 0,
      ),
      backgroundColor: AppColors.whiteBackground,
      body: SingleChildScrollView( // 스크롤 가능하도록 설정
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabelAndTextField('이름', _nameController, enabled: false),
            SizedBox(height: 16),
            _buildLabelAndTextField('아이디', _idController, enabled: false),
            SizedBox(height: 16),
            _buildLabelAndTextField('비밀번호', _passwordController, obscureText: true),
            SizedBox(height: 16),
            _buildLabelAndTextField('비밀번호 확인', _confirmPasswordController, obscureText: true),
            SizedBox(height: 16),
            _buildLabelAndTextField('센터 코드', _centerCodeController, enabled: false),
            SizedBox(height: 8),
            Text(
              '센터 코드는 변경할 수 없습니다.\n고객센터: 1588-9999',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 로그아웃 로직 추가 필요
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                minimumSize: Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                '로그아웃',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // 내 정보 수정하기 로직 추가 필요
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackButton,
                minimumSize: Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                '내 정보 수정하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelAndTextField(String label, TextEditingController controller, {bool obscureText = false, bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey[200],
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
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
