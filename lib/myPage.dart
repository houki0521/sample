import 'package:flutter/material.dart';
import 'login.dart';
import 'navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key, required this.title});
  final String title;

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  bool _isLoggedIn = false; // ログイン状態を追跡

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
        
      });
    } else {
      setState(() {
        _isLoggedIn = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('マイページ'),
      ),

      body: Center(
        child: _isLoggedIn ? notLoggedIn() : Text('ログインされています')
      ),
    );
  }
  // ログインしていない場合
  Widget notLoggedIn () {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Text("行ったお店の感想を共有しませんか？"),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 9),
          child: Text("ログインすると、投稿した写真や口コミが表示されます"),
        ),
        Container(
          child: ElevatedButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => (LoginPage())),
            );      
          },
          child: Text('無料会員登録/ログイン')
          ),
        ),
      ],
    );
  }
  // ログインしている場合
  Widget isLoggedIn () {
    return Column(
      children: <Widget>[
        Center(
          child: Text('ログインされています'),
        )
      ],
    );
  }
}