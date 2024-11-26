import 'package:flutter/material.dart';
import 'package:sample/homePage.dart';
import 'myPage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('マイページ設定'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('ニックネーム'),
          Container(
            padding: EdgeInsets.only(left: _screenSize.width * 0.02, right: _screenSize.width * 0.02),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '入力フォーム',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}