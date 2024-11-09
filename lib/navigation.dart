import 'package:flutter/material.dart';
import 'package:sample/homePage.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: MyHomePage(title: 'ホーム画面')),
    Center(child: Text('検索')),
    Center(child: Text('保存リスト')),
    Center(child: Text('タイムライン'),),
    Center(child: Text('閲覧履歴'),),
    Center(child: Text('マイページ'),)
  ];

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
            icon: Icon(Icons.account_circle),
            label: 'マイページ',
            )
        ],
      ),
    );
  }
}
