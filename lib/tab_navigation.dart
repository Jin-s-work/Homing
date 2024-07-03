import 'package:flutter/material.dart';
import 'list_page.dart';
import 'map_page.dart';
import 'profile_page.dart';
import 'colors.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          ListPage(),
          MapPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.orange, // 선택된 탭의 텍스트 색상
          unselectedLabelColor: Colors.grey, // 선택되지 않은 탭의 텍스트 색상
          tabs: [
            Tab(
              icon: Image.asset(
                _tabController.index == 0
                    ? 'assets/list_orange.png'
                    : 'assets/list_gray.png',
                width: 32,
                height: 32,
              ),
              text: '명단 모아보기',
            ),
            Tab(
              icon: Image.asset(
                _tabController.index == 1
                    ? 'assets/map_orange.png'
                    : 'assets/map_gray.png',
                width: 32,
                height: 32,
              ),
              text: '지도',
            ),
            Tab(
              icon: Image.asset(
                _tabController.index == 2
                    ? 'assets/info_orange.png'
                    : 'assets/info_gray.png',
                width: 32,
                height: 32,
              ),
              text: '내 정보',
            ),
          ],
        ),
      ),
    );
  }
}
