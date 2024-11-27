import 'package:flutter/material.dart';
import 'package:sample/homePage.dart';
import 'myPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'lists.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _selectedPrefecture;
  String? _selectedgender;
  String? _selection = '非公開';
  List<String> gender = [
    '未設定',
    '男性',
    '女性',
  ];
  final List<String> selection = ['非公開','公開',];
  final List<String> s_selection = ['非公開','公開',];
  int? _selectedYear;
  int? _selectedMonth;
  int? _selectedDay;
  String? _s_selection = '非公開';

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
                  const Text('ニックネーム'),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '入力フォーム',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('現住所'),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text('$_selection',),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (BuildContext context){
                          return selection.map((String value){
                            return PopupMenuItem(
                              value: value,
                              child: RadioListTile(
                                title: Text(value),
                                value: value,
                                groupValue: _selection,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selection = value;
                                    print('$_selection');
                                    Navigator.of(context).pop();
                                  });
                                }
                              )
                            );
                          }).toList();
                        },
                        initialValue: _selection,
                        onSelected: (String? value) {
                          setState(() {
                            _selection = value;
                            print('$_selection');
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
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('性別'),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text('$_s_selection',),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        itemBuilder: (BuildContext context){
                          return s_selection.map((String value){
                            return PopupMenuItem(
                              value: value,
                              child: RadioListTile(
                                title: Text(value),
                                value: value,
                                groupValue: _s_selection,
                                onChanged: (String? value) {
                                  setState(() {
                                    _s_selection = value;
                                    print('$_s_selection');
                                    Navigator.of(context).pop();
                                  });
                                }
                              )
                            );
                          }).toList();
                        },
                        initialValue: _s_selection,
                        onSelected: (String? value) {
                          setState(() {
                            _selection = value;
                            print('$_s_selection');
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
                  const Text('生年月日'),
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
                  
                ],
              )  
          )
        ],
      ),
    );
  }
  Future<void> _calculation(BuildContext context) async {
    
  }
}
