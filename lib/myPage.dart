import 'package:flutter/material.dart';
import 'login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'add_photo.dart';
import 'profile.dart';
import 'posting.dart';
import 'package:auto_route/auto_route.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key, required this.title});
  final String title;

  @override
  State<Mypage> createState() => _MypageState();
}

@RoutePage()
class _MypageState extends State<Mypage> {
  final SupabaseClient supabase = Supabase.instance.client;
  bool _isLoggedIn = false; // ログイン状態を追跡
  User? user;
  String? userEmail;
  int _wentcounter = 0;
  int _wordOfMouth = 0;
  int _followUsOn = 0;
  int _followers = 0;

  void initState() {
    super.initState();
    _checkLoginStatus(); // ログイン状態を確認
  }

  // ログイン状態を確認するメソッド
  void _checkLoginStatus() async {
    final User? user = supabase.auth.currentUser;
    if (user != null) {
      setState(() {
        _isLoggedIn = true;
        _loadUserData();
        print('メールアドレス: $userEmail');     
      });
    } else {
      setState(() {
        _isLoggedIn = false;
      });
    }
  }
  // ユーザーデータを取得する非同期メソッド
  Future<void> _loadUserData() async {
  user = supabase.auth.currentUser;
  if (user != null) {
    setState(() {
      userEmail = user?.email;
    });
  }
}

void _incrementwentCounter() {
    setState(() {
      _wentcounter ++;
    });
  }

  void _incrementwordOfMouthCounter() {
    setState(() {
      _wordOfMouth ++;
    });
  }

  void _incrementfollowUsOnCounter() {
    setState(() {
      _followUsOn ++;
    });
  }
  void _incrementfollowersCounter() {
    setState(() {
      _followers ++;
    });
  }
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text('マイページ'),
        ),
        body: Center(
          child: _isLoggedIn ? isLoggedIn() : notLoggedIn(),
        ),
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
    var _screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.account_circle),
              Column(
                children: <Widget>[
                  Text(
                    '$_wentcounter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                  Text('行った'),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '$_wordOfMouth',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                  Text('口コミ'),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '$_followUsOn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                  Text('フォロー'),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '$_followers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                  Text('フォロワー'),
                ],
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: _screenSize.height * 0.04,
                width: _screenSize.width * 0.8,
                child: OutlinedButton(
                onPressed: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text('プロフィール編集'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
                ),
              ),
              ),
              Row(
                children: <Widget>[
                  IconButton(onPressed: () {},
                  icon: Icon(Icons.qr_code_outlined)
                  ),
                ],
              ),
            ],
          ),
        ),
        TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.grid_view),),
            Tab(icon: Icon(Icons.list_sharp)),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '行ったお店を記録しよう',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      ),
                    Text(
                      '感想や写真を残すことができます',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddPhoto()),
                        );
                      },
                      child: Text('さっそく投稿する'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '行ったお店を記録しよう',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      ),
                    Text(
                      '感想や写真を残すことができます',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddPhoto()),
                          );
                        },
                        child: Text('さっそく投稿する'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostingPage()),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.mode_edit_outline_outlined),
                Text('投稿'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}