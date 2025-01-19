import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:flutter/gestures.dart';
import 'signup.dart';

// ログイン画面用Widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SupabaseClient supabase = Supabase.instance.client;
  final SupabaseClient supabaseClient = Supabase.instance.client;

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
                  obscureText: _isVisible,
                  decoration: InputDecoration(
                  hintText: 'パスワード',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                  icon: Icon(
                    _isVisible ? Icons.visibility_off : Icons.visibility
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
                        text: 'アカウントを登録するには',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'こちら',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignupPage()),
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
                    signInWithEmailPassword(email, password);
                  },
                  child: Text(
                    'ログイン',
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> signInWithEmailPassword(String email, String password) async {
  try {
    final supabase = Supabase.instance.client;

    // Supabaseクライアントを利用してログイン
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final Session? session = res.session; // セッション情報
    final User? user = res.user;         // ユーザー情報

    // ログイン成功後に次のページへ遷移
    if (session != null && user != null) {
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      setState(() {
        infoText = 'ログイン失敗: セッションまたはユーザー情報がありません。';
      });
    }
  } on AuthException catch (e) {
    // Supabase認証エラー
    setState(() {
      infoText = 'ログイン失敗: ${e.message}';
    });
  } catch (e) {
    // その他のエラー
    setState(() {
      infoText = 'ログイン失敗: ${e.toString()}';
    });
  }
}

}