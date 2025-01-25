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
  String? P_selection = '非公開';
  List<String> gender = [
    '未設定',
    '男性',
    '女性',
  ];
  final List<String> p_selection = [
    '非公開',
    '公開',
  ];
  final List<String> g_selection = [
    '非公開',
    '公開',
  ];
  int? _selectedYear;
  int? _selectedMonth;
  int? _selectedDay;
  String? G_selection = '非公開';
  TextEditingController user_name = TextEditingController();
  TextEditingController Title_controller = TextEditingController();
  TextEditingController SubTitle_controller = TextEditingController();
  TextEditingController SelfIntroduction_controller = TextEditingController();

  //final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    Title_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 215, 65, 55),
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                              color: const Color.fromARGB(255, 215, 65, 55)),
                        ),
                        child: Text(
                          "必須",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: user_name,
                    decoration: const InputDecoration(
                      hintText: '入力',
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '$P_selection',
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return p_selection.map((String value) {
                            return PopupMenuItem(
                                value: value,
                                child: RadioListTile(
                                    title: Text(value),
                                    value: value,
                                    groupValue: P_selection,
                                    onChanged: (String? value) {
                                      setState(() {
                                        P_selection = value;
                                        print('$P_selection');
                                        Navigator.of(context).pop();
                                      });
                                    }));
                          }).toList();
                        },
                        initialValue: P_selection,
                        onSelected: (String? value) {
                          setState(() {
                            P_selection = value;
                            print('$P_selection');
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '$G_selection',
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return g_selection.map((String value) {
                            return PopupMenuItem(
                                value: value,
                                child: RadioListTile(
                                    title: Text(value),
                                    value: value,
                                    groupValue: G_selection,
                                    onChanged: (String? value) {
                                      setState(() {
                                        G_selection = value;
                                        print('$G_selection');
                                        Navigator.of(context).pop();
                                      });
                                    }));
                          }).toList();
                        },
                        initialValue: G_selection,
                        onSelected: (String? value) {
                          setState(() {
                            G_selection = value;
                            print('$G_selection');
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 215, 65, 55),
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                              color: const Color.fromARGB(255, 215, 65, 55)),
                        ),
                        child: Text(
                          "必須",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: Title_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'サブタイトル',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: SubTitle_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '自己紹介文',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: SelfIntroduction_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              )),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  await_saveProfileData();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(410, 40),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    )),
                child: Text(
                  '決定',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                )),
          ),
        ],
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    await supabase.auth.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Future<void> await_saveProfileData() async {
    try {
      final String data = '${_selectedYear}年${_selectedMonth}月${_selectedDay}日';
      Map<String, dynamic> ProfileData = {
        'user_name': user_name.text,
        'Prefecture': _selectedPrefecture,
        'gender_public_Publish': g_selection,
        'gender': _selectedgender,
        'date_of_birth': data,
        'title': Title_controller.text,
        'subtitle': SubTitle_controller.text,
        'self_introduction': SelfIntroduction_controller.text,
        'prefecture_public_Publish': P_selection,
      };
      print(ProfileData);
      // データ保存
      final response = await supabase
          .from('ProfileData') // テーブル名を指定
          .insert(ProfileData); // データを挿
      // responseの中身を表示
      print('データを保存しました: ${response}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('データを保存しました')),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      print('エラー: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラーが発生しました: $e')),
      );
    }
  }
}
