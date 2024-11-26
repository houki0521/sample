import 'package:flutter/material.dart';
import 'lists.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  

  // String? _selectedprefecturesValue = '選択してください';
  List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];
  String _selectedValue = '有';
  int? _selectedMonth;
  int? _selectedDay;
  String? _day;
  String? _selectedPrefecture;
  String? _selectedCategory;
  String? _selectedSubCategory;
  String? _selectedDish;
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 5, // 縦線の太さ
                              height: 20, // 縦線の高さ
                              color: Colors.orange,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                              child: const Text(
                                '店名',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008),
                        const Text('店名'),
                        SizedBox(height: _screenSize.height * 0.008),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '例 レストラン タベログ',
                          ),
                        ),
                        SizedBox(height: _screenSize.height * 0.008),
                        Text('フリガナ'),
                        SizedBox(height: _screenSize.height * 0.008),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '例 レストランタベログエビステン',
                          ),
                        ),
                        SizedBox(height: _screenSize.height * 0.085,),
                        Row(
                          children: <Widget>[
                            Container(
                            width: 5,
                            height: 20,
                            color: Colors.orange,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: _screenSize.width * 0.050),
                              child: const Text(
                                '電話番号',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: const Text(
                          '電話番号の間違いは、お店や第三者の迷惑となりますので正しく入力してください',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start, 
                          children: <Widget>[
                            Radio(
                              // ラジオボタンが持つ値
                              value: '有',
                              // 現在選択されているラジオボタンの値
                              groupValue: _selectedValue,
                              // ラジオボタンが選択されたときの処理
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedValue = '有';
                                  print(_selectedValue);
                                });
                              },
                            ),
                            const Text('有'),      
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 45,
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '例 01-2345-6789',
                                    hintStyle: TextStyle(
                                      fontSize: 13
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              // ラジオボタンが持つ値
                              value: '無（不明または非公開）',
                              // 現在選択されているラジオボタンの値
                              groupValue: _selectedValue,
                              // ラジオボタンが選択されたときの処理
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedValue = '無（不明または非公開）';
                                  print(_selectedValue);
                                });
                              },
                            ),
                            const Text('無（不明または非公開）'),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.050,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 5,
                              height: 20,
                              color: Colors.orange,
                              ),
                            Container(
                              padding: EdgeInsets.only(left: _screenSize.width * 0.008),
                              child: const Text(
                                '所在地情報',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        const Text('都道府県'),
                        SizedBox(height: _screenSize.height * 0.008,),
                        SingleChildScrollView(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              hintText: '選択してください',
                              border: OutlineInputBorder(),
                            ),
                            items: prefectures.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                                );
                              }).toList(),
                              value: _selectedPrefecture,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedPrefecture = value;
                                  print('Selected: $_selectedPrefecture');
                                });
                              }
                            ),
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Text('市区町村・番地'),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Container(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '例 恵比寿区恵比寿南3-5-7',
                            ),
                          ),
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Text('ビル名・階数'),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Container(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '例 デジタルゲートビル 6F',
                            ),
                          ),
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        const Text('地図'),
                        SizedBox(height: _screenSize.height * 0.050,),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 5,
                              height: 20,
                              color: Colors.orange,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                                child: const Text(
                                  'オープン日',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            SizedBox(height: _screenSize.height * 0.008,),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008),
                        Row(
                          children: <Widget>[
                            Container(
                              width: _screenSize.width * 0.17,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '1992',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text('年'),
                            ),
                            Flexible(
                              child: Container(
                                // padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: DropdownButtonFormField<int>(
                                  decoration: const InputDecoration(
                                    hintText: '12',
                                    border: OutlineInputBorder(),
                                  ),
                                  items: month_number.map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _selectedMonth,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedMonth = value;
                                      print('Selected month: $_selectedMonth');
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text('月'),
                            ),
                            Flexible(
                              child: Container(
                                child: DropdownButtonFormField<int>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '31',
                                  ),
                                  items: day_number.map<DropdownMenuItem<int>>((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                      );
                                  }).toList(),
                                  value: _selectedDay,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedDay = value;
                                      print('Selected month: $_selectedDay');
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text('日'),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.050,),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 5,
                              height: 20,
                              color: Colors.orange,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                                child: const Text(
                                  'ジャンル',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            SizedBox(height: _screenSize.height * 0.008,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: FittedBox(
                                child: DropdownButton<String>(
                                  hint: Text('カテゴリを選択'),
                                  value: _selectedCategory,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedCategory = newValue;
                                      _selectedSubCategory = null; // サブカテゴリをリセット
                                      _selectedDish = null; // 料理をリセット
                                    });
                                  },
                                  items: menuData.keys.map((category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category),
                                    );
                                  }).toList(),
                                ),
                              ),  
                            ),
                            // サブカテゴリ選択プルダウン
                            if (_selectedCategory != null)
                            Expanded(
                              child: DropdownButton<String>(
                                hint: Text('サブカテゴリを選択'),
                                value: _selectedSubCategory,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSubCategory = newValue;
                                    _selectedDish = null; // 料理をリセット
                                  });
                                },
                                items: menuData[_selectedCategory!]!.keys.map((subCategory) {
                                  return DropdownMenuItem<String>(
                                    value: subCategory,
                                    child: Text(subCategory),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      // 料理選択プルダウン
                      if (_selectedSubCategory != null)
                        DropdownButton<String>(
                          hint: Text('料理を選択'),
                          value: _selectedDish,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedDish = newValue;
                            });
                          },
                          items: menuData[_selectedCategory!]![_selectedSubCategory!]!.keys.map((dish) {
                            return DropdownMenuItem<String>(
                              value: dish,
                              child: Text(dish),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: _screenSize.height * 0.050,),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 5,
                              height: 20,
                              color: Colors.orange,
                              
                            ),
                            SizedBox(width: _screenSize.width * 0.010,),
                            Text(
                              'ホームページ・公式SNSアカウント',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '例 https//',
                              border: OutlineInputBorder()
                              ),
                            ),
                        ),
                        SizedBox(height: _screenSize.height * 0.050,),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 5,
                              height: 20,
                              color: Colors.orange,
                              
                            ),
                            SizedBox(width: _screenSize.width * 0.010,),
                            Text(
                              '営業時間',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        ListView.builder(
                          itemCount: weekdays.length,
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}