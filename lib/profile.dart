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

  String? _selectedPrefecture = '選択してください';
  String? _selection = '非公開';

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('マイページ設定'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ニックネーム'),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '入力フォーム',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
