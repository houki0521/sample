import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/myPage.dart';
import 'package:flutter/gestures.dart';
import 'login.dart';

// ログイン画面用Widget
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'メールアドレス',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  obscureText: !_isVisible,
                  decoration: InputDecoration(
                  hintText: 'パスワード',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                  icon: Icon(
                    _isVisible ? Icons.visibility : Icons.visibility_off,  // 状態に応じてアイコンを切り替え
                  ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              Container(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'ログインは',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'こちら',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>LoginPage()),
                          );
                        }
                      ),
                      TextSpan(
                        text: 'をクリック',
                        style: TextStyle(color: Colors.black),
                      )
                    ]
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    createUserWithEmailAndPassword(email, password);
                  },
                  child: Text('ユーザー登録')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
  try {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) {
        return Mypage(title: 'マイページ',);
        }),
      );
  } catch (e) {
    setState(() {
      infoText = 'ユーザー登録失敗: ${e.toString()}';
    });
  }
  }
}