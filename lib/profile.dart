import 'package:flutter/material.dart';
import 'package:sample/homePage.dart';
import 'myPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'lists.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SupabaseClient supabase = Supabase.instance.client;
  String? _selectedPrefecture;
  String? _selectedgender;
  String? _P_selection = '非公開';
  List<String> gender = [
    '未設定',
    '男性',
    '女性',
  ];
  final List<String> selection = [
    '非公開',
    '公開',
  ];
  final List<String> s_selection = [
    '非公開',
    '公開',
  ];
  int? _selectedYear;
  int? _selectedMonth;
  int? _selectedDay;
  String? _g_selection = '非公開';
  TextEditingController _controller = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ設定'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'ニックネーム',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Text(
                        "必須",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '入力フォーム',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '現住所',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '$_P_selection',
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return selection.map((String value) {
                            return PopupMenuItem(
                                value: value,
                                child: RadioListTile(
                                    title: Text(value),
                                    value: value,
                                    groupValue: _P_selection,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _P_selection = value;
                                        print('$_P_selection');
                                        Navigator.of(context).pop();
                                      });
                                    }));
                          }).toList();
                        },
                        initialValue: _P_selection,
                        onSelected: (String? value) {
                          setState(() {
                            _P_selection = value;
                            print('$_P_selection');
                          });
                        },
                      ),
                    ],
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: '未設定',
                      border: OutlineInputBorder(),
                    ),
                    items: prefectures.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    value: _selectedPrefecture,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPrefecture = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '性別',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '$_g_selection',
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return s_selection.map((String value) {
                            return PopupMenuItem(
                                value: value,
                                child: RadioListTile(
                                    title: Text(value),
                                    value: value,
                                    groupValue: _g_selection,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _g_selection = value;
                                        print('$_g_selection');
                                        Navigator.of(context).pop();
                                      });
                                    }));
                          }).toList();
                        },
                        initialValue: _g_selection,
                        onSelected: (String? value) {
                          setState(() {
                            _g_selection = value;
                            print('$_g_selection');
                          });
                        },
                      ),
                    ],
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: '未設定',
                      border: OutlineInputBorder(),
                    ),
                    items: gender.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    value: _selectedgender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedgender = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '生年月日',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              hintText: '-',
                              border: OutlineInputBorder(),
                            ),
                            items: year_number
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value.toString()));
                            }).toList(),
                            value: _selectedYear,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedYear = value!;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('年'),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              hintText: '-',
                              border: OutlineInputBorder(),
                            ),
                            items: month_number
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value.toString()));
                            }).toList(),
                            value: _selectedMonth,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedMonth = value!;
                              });
                            }),
                      ),
                      const SizedBox(width: 7),
                      const Text('月'),
                      const SizedBox(width: 7),
                      Expanded(
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              hintText: '-',
                              border: OutlineInputBorder(),
                            ),
                            items: day_number
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem(
                                  value: value, child: Text(value.toString()));
                            }).toList(),
                            value: _selectedDay,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedDay = value!;
                              });
                            }),
                      ),
                      const SizedBox(width: 7),
                      const Text('日'),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        'タイトル',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Text(
                        "必須",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () async {
                        signOut(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // ボタンのサイズをテキストに合わせる
                        children: [
                          Text('ログアウト'),
                          SizedBox(width: 8), // テキストとアイコンの間にスペースを追加
                          Icon(Icons.logout),
                        ],
                      ),
                    ),
            ),
              ],
            )
          )
        ],
      ),
    );
  }

  Future<void> _calculation(BuildContext context) async {
    int? age = int.tryParse(_controller.text);

    if (age == null) {
      setState(() {
        _result = "-";
      });
      return;
    }

    if (age < 20) {
      setState(() {
        _result = "10代以下";
      });
    } else {
      int remainder = age % 10;
      if (remainder < 5) {
        setState(() {
          _result = "${age ~/ 10 * 10}代前半";
        });
      } else {
        setState(() {
          _result = "${age ~/ 10 * 10}代後半";
        });
      }
    }
  }

  

  Future<void> signOut(BuildContext context) async {
    await supabase.auth.signOut();
    Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

