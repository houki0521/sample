import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:flutter/gestures.dart';
import 'login.dart';

// ログイン画面用Widget
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SupabaseClient supabase = Supabase.instance.client;

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
                    _isVisible ? Icons.visibility_off : Icons.visibility,  // 状態に応じてアイコンを切り替え
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
                    ]
                  ),
                ),
              ),
              Container(
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 221, 202, 32)
                  ),
                  onPressed: () {
                    createUserWithEmailAndPassword(email, password);
                  },
                  child: Text(
                    'ユーザー登録',
                    style: TextStyle(
                      color: Colors.black
                    ),
                    )
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
    // Supabaseで新規ユーザー登録
    final AuthResponse res = await supabase.auth.signUp(
      email: email, // 関数の引数を使用
      password: password,
    );

    // ユーザー情報とセッション情報を取得
    final Session? session = res.session;
    final User? user = res.user;

    // ユーザーが正常に作成されたか確認
    if (user != null) {
      // ユーザー登録が成功した場合
      setState(() {
        infoText = 'ユーザー登録が成功しました: ${user.email}';
      });

      // マイページへ遷移
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      // ユーザー情報が取得できない場合
      setState(() {
        infoText = 'ユーザー情報の取得に失敗しました';
      });
    }
  } catch (e) {
    // エラーハンドリング
    setState(() {
      infoText = 'ユーザー登録失敗: ${e.toString()}';
    });
  }
}
}