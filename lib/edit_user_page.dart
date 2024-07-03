import 'package:flutter/material.dart';
import 'colors.dart';

class EditUserPage extends StatefulWidget {
  final Map<String, String> user;

  EditUserPage({required this.user});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _nameController;
  late TextEditingController _statusController;
  late TextEditingController _remarksController;
  late TextEditingController _locationController;
  String _gender = '남';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user['name']);
    _statusController = TextEditingController(text: widget.user['status']);
    _remarksController = TextEditingController(text: '2024/05/21\n광장에서 쉬고 계심.\n2024/05/23\n자리에 안 계심.');
    _locationController = TextEditingController(text: widget.user['location']);
    _gender = '남';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _statusController.dispose();
    _remarksController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    Navigator.pop(context, {
      'name': _nameController.text,
      'status': _statusController.text,
      'remarks': _remarksController.text,
      'location': _locationController.text,
      'gender': _gender,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '기록 수정하기',
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
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: '이름'),
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('성별', style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          ChoiceChip(
                            label: Text('남'),
                            selected: _gender == '남',
                            onSelected: (selected) {
                              setState(() {
                                _gender = '남';
                              });
                            },
                            selectedColor: Colors.orange,
                          ),
                          SizedBox(width: 8),
                          ChoiceChip(
                            label: Text('여'),
                            selected: _gender == '여',
                            onSelected: (selected) {
                              setState(() {
                                _gender = '여';
                              });
                            },
                            selectedColor: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: _locationController,
                        decoration: InputDecoration(labelText: '최근 위치'),
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
              child: TextField(
                controller: _statusController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
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
              child: TextField(
                controller: _remarksController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
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
                    onPressed: _saveChanges,
                    child: Text(
                      '수정 완료하기',
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
