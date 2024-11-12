import 'package:flutter/material.dart';
import 'package:sample/homePage.dart';
import 'myPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationPage extends StatefulWidget {

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  bool _isLoggedIn = false; // ログイン状態を追跡
  

  final List<Widget> _pages = [
    const Center(child: MyHomePage(title: 'ホーム画面')),
    const Center(child: Text('検索')),
    const Center(child: Text('保存リスト')),
    const Center(child: Text('タイムライン'),),
    const Center(child: Text('閲覧履歴'),),
    const Center(child: Text('マップ'),),
    const Center(child: Mypage(title: 'マイページ',),)
  ];

    void initState() {
    super.initState();
    _checkLoginStatus(); // ログイン状態を確認
  }

  // ログイン状態を確認するメソッド
  void _checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _isLoggedIn = true;
        _currentIndex = 5; // ログインしている場合はマイページを最初に表示
      });
    } else {
      setState(() {
        _isLoggedIn = false;
      });
    }
  }

  // タブがタップされたときにインデックスを更新するメソッド
  void _onItemTapped(int index) {
    if (index < _pages.length){
      setState(() {
      _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // 現在のインデックス
        onTap: _onItemTapped, // タップ時の動作
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '保存リスト',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'タイムライン',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '閲覧履歴',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_sharp),
            label: 'マップ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'マイページ',
            )
        ],
      ),
    );
  }
}
