import 'package:flutter/material.dart';
import 'colors.dart';
import 'edit_user_page.dart'; // EditUserPage 파일 import

class UserDetailPage extends StatefulWidget {
  final Map<String, String> user;

  UserDetailPage({required this.user});

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late Map<String, String> _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  void _editUser() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUserPage(user: _user),
      ),
    );

    if (result != null) {
      setState(() {
        _user = {
          ..._user,
          'name': result['name'],
          'status': result['status'],
          'remarks': result['remarks'],
          'location': result['location'],
          'gender': result['gender'],
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '명단 모아보기',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // 둥근 사각형 모서리 설정
                  child: Image.asset(
                    'assets/man_image.png',
                    width: 136,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _user['name'] ?? '이름 없음',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('성별: ${_user['gender'] ?? '남자'}', style: TextStyle(fontSize: 18)), // Assuming gender is male
                      SizedBox(height: 8),
                      Text(
                        '최근 위치: ${_user['location'] ?? '위치 정보 없음'}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('건강 상태', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              width: 352,
              height: 76,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[300], // 배경색을 라이트 그레이로 설정
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${_user['status'] ?? '건강 상태 정보 없음'}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            Text('특이사항', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              width: 352,
              height: 139,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[300], // 배경색을 라이트 그레이로 설정
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${_user['remarks'] ?? '특이사항 정보 없음'}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackButton,
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: _editUser,
                    child: Text(
                      '기록 수정하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'AppleSDGothicNeo',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // 전체 복사하기 로직 추가 필요
                    },
                    child: Text(
                      '전체 복사하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'AppleSDGothicNeo',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
