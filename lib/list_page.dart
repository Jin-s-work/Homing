import 'package:flutter/material.dart';
import 'colors.dart';
import 'user_detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Map<String, String>> _users = [
    {
      "name": "김아무개",
      "location": "서울역 광장, 1일 전",
      "status": "피부 질환"
    },
    {
      "name": "김철수",
      "location": "연세빌딩 앞, 2일 전",
      "status": "고혈압"
    },
    {
      "name": "김영희",
      "location": "연세빌딩 지하도, 오늘",
      "status": "이상 없음"
    },
    {
      "name": "홍길동",
      "location": "남대문 지하도, 오늘",
      "status": "이상 없음"
    },
    {
      "name": "홍길순",
      "location": "남대문 지하도, 오늘",
      "status": "이상 없음"
    },
  ];

  List<Map<String, String>> _filteredUsers = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredUsers = _users;
    _searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterUsers);
    _searchController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _users.where((user) {
        final name = user['name']?.toLowerCase() ?? '';
        return name.contains(query);
      }).toList();
    });
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 44,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: '이름 검색하기',
                  filled: true, // 배경색을 채우기 위해 추가
                  fillColor: Colors.white, // 배경색을 하얗게 설정
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(user: _filteredUsers[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), // 둥근 사각형 모서리 설정
                          child: Image.asset(
                            'assets/man_image.png',
                            width: 84,
                            height: 84,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _filteredUsers[index]['name'] ?? '이름 없음',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '최근 위치: ${_filteredUsers[index]['location'] ?? '위치 정보 없음'}',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '건강 상태: ${_filteredUsers[index]['status'] ?? '건강 상태 정보 없음'}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
