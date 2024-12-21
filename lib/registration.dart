import 'package:flutter/material.dart';
import 'lists.dart';
import 'registration_detailed.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});


  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  

  List<String> weekdays = ['月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日', '日曜日'];
  List<String> weekday = ['月', '火', '水', '木', '金', '土', '日'];
  List<String> selectedTime = ['時間を指定','24時間営業', '定休日'];
  Map<String, String?> _selectedTimes = {};
  String _selectedValue = '有';
  int? _selectedMonth;
  int? _selectedDay;
  String startTime = '';
  String endTime = '';
  String? _selectedPrefecture;
  String? _selectedCategory;
  String? _selectedSubCategory;
  String? _selectedDish;
  final Map<String, TextEditingController> _startTimeControllers = {};
  final Map<String, TextEditingController> _endTimeControllers = {};
  final TextEditingController _storeNamecontroller = TextEditingController();
  final TextEditingController _furiganaController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _municipalities_Controller = TextEditingController();
  final TextEditingController _buildingNameFloorNumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _homePageURLController = TextEditingController();
  
  
  
  @override
  void initState() {
  super.initState();
  weekdays.forEach((day) {
      _startTimeControllers[day] = TextEditingController();
      _endTimeControllers[day] = TextEditingController();
      _selectedTimes[day] = null;
    });
}

@override
void dispose() {
  _startTimeControllers.values.forEach((controller) => controller.dispose());
  _endTimeControllers.values.forEach((controller) => controller.dispose());
  _storeNamecontroller.dispose();
  _furiganaController.dispose();
  _municipalities_Controller.dispose();
  _buildingNameFloorNumberController.dispose();
  _homePageURLController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('店舗登録情報編集'),
      ),
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
                        Row(
                          children: [
                            const Text(
                              '店名',
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
                                fontSize: 12,
                                color: Colors.white
                              ),
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008),
                        TextFormField(
                          controller: _storeNamecontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '例 レストラン タベログ',
                          ),
                          onChanged: (value) {
                            // print(value); // 入力が変更されるたびに現在の値を出力
                          },
                        ),
                        SizedBox(height: _screenSize.height * 0.008),
                        Row(
                          children: [
                            Text(
                            'フリガナ',
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
                                fontSize: 12,
                                color: Colors.white
                              ),
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008),
                        TextFormField(
                          controller: _furiganaController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '例 レストランタベログエビステン',
                          ),
                          onChanged: (value) {
                            // print(value);
                          },
                        ),
                        SizedBox(height: _screenSize.height * 0.050,),
                        Row(
                          children: <Widget>[
                            Container(
                            width: 5,
                            height: 20,
                            color: Colors.orange,
                            ),
                            Row(
                              children: [
                                    Container(
                                  padding: EdgeInsets.only(left: _screenSize.width * 0.008),
                                  child: const Text(
                                    '電話番号',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
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
                                    fontSize: 12,
                                    color: Colors.white
                                  ),
                                ),
                                ),
                              ],
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
                                  controller: _phoneNumberController,
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
                        Row(
                          children: [
                            const Text(
                            '都道府県',
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
                                fontSize: 12,
                                color: Colors.white
                              ),
                            ),
                            ),
                          ],
                        ),
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
                                  // print('Selected: $_selectedPrefecture');
                                });
                              }
                            ),
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Row(
                          children: [
                            Text(
                            '市区町村・番地',
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
                                fontSize: 12,
                                color: Colors.white
                              ),
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Container(
                          child: TextFormField(
                            controller: _municipalities_Controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '例 恵比寿区恵比寿南3-5-7',
                            ),
                            onChanged: (value) {
                            },
                          ),
                        ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Text(
                          'ビル名・階数',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        SizedBox(height: _screenSize.height * 0.008,),
                        Container(
                          child: TextFormField(
                            controller: _buildingNameFloorNumberController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '例 デジタルゲートビル 6F',
                            ),
                            onChanged: (value) {

                            },
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
                                controller: _ageController,
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
                            Row(
                              children: [
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
                                    fontSize: 12,
                                    color: Colors.white
                                  ),
                                ),
                                ),
                              ],
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
                            controller: _homePageURLController,
                            decoration: InputDecoration(
                              hintText: '例 https//',
                              border: OutlineInputBorder()
                              ),
                              onChanged: (value) {
                              },
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
                        Container(
                          width: _screenSize.width * 1.5,
                          padding: EdgeInsets.symmetric(vertical: _screenSize.height * 0.01),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                            )
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true, // 高さを親に依存させない
                          physics: NeverScrollableScrollPhysics(), // 内部でスクロールを防ぐ
                          itemCount: weekdays.length,
                          itemBuilder: (context, index) {
                            final day = weekdays[index];
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                  right: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                  bottom: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                                )
                              ),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 子ウィジェットの配置
                                  children: [
                                    Text(weekdays[index]),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                                subtitle: _selectedTimes[day] == '時間を指定'
                                  ? Text('${_startTimeControllers[day]?.text ?? ''} ～ ${_endTimeControllers[day]?.text ?? ''}')
                                  : Text(_selectedTimes[day] ?? '未選択'),
                                  
                                onTap: () {
                                  // print('_selectedTimes: $_selectedTimes');
                                  _showTimeDialog(context, day);
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                      onPressed: () {
                        _saveData(context);

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,  // 背景色
                        foregroundColor: Colors.white,  // 文字色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),  // 丸みをつける
                        ),
                      ),
                      child: const Text('次へ'),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _showTimeDialog(BuildContext context, String day) async {
  await showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
          width: MediaQuery.of(context).size.width, // 画面幅いっぱい
          // height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Columnのサイズを最小限に設定
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                  Text(day),
                  GestureDetector(
                    onTap: () {
                      // 入力クリア処理
                      _startTimeControllers[day]!.clear();
                      _endTimeControllers[day]!.clear();
                    },
                    child: Text(
                      'クリア',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: [
                      ...selectedTime.map((String value) {
                        return RadioListTile<String>(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(value),
                              if (_selectedTimes[day] == '時間を指定' && value == '時間を指定') ...[
                                SizedBox(height: 8),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                          controller: _startTimeControllers[day],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '開始時間',
                                            contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 12.0),
                                          ),
                                          style: TextStyle(fontSize: 14.0),
                                          onTap: () async {
                                            _selectTime(context, _startTimeControllers[day]!);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: SizedBox(
                                        height: 40,
                                        child: TextFormField(
                                          controller: _endTimeControllers[day],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '終了時間',
                                            contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 12.0),
                                          ),
                                          style: TextStyle(fontSize: 14.0),
                                          onTap: () async {
                                            _selectTime(context, _endTimeControllers[day]!);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                          value: value,
                          groupValue: _selectedTimes[day],
                          onChanged: (String? value) {
                            setState(() {
                              _selectedTimes[day] = value; // 選択を更新
                            });
                          },
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  setState((){});
                  _saveDataTime(context);
                },
                child: Text('決定')
                ),
              ),
            ],
          ),
      );
    },
  );
}

Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {
    controller.text = picked.format(context);
  }
}
Future<void> _saveData(BuildContext context) async {
  String storeNamecontroller = _storeNamecontroller.text;
  String furiganaController = _furiganaController.text;
  String? selectedValue = _selectedValue;
  String phoneNumberController = _phoneNumberController.text;
  String? selectedPrefecture = _selectedPrefecture;
  String municipalities_Controller = _municipalities_Controller.text;
  String buildingNameFloorNumberController = _buildingNameFloorNumberController.text;
  String ageController = _ageController.text;
  int? selectedMonth = _selectedMonth;
  int? selectedDay = _selectedDay;
  String? selectedCategory = _selectedCategory;
  String? selectedSubCategory = _selectedSubCategory;
  String? selectedDish = _selectedDish;
  String homePageURLController = _homePageURLController.text;

  // オープン日の文字列を作成
  String openDate = '$ageController年${selectedMonth ?? ''}月${selectedDay ?? ''}日';

  // 営業時間データを収集
  Map<String, String> times = {};
  for (var day in weekdays) {
    String startTime = _startTimeControllers[day]!.text;
    String endTime = _endTimeControllers[day]!.text;
    if (startTime.isNotEmpty && endTime.isNotEmpty) {
      times[day] = '$day $startTime ～ $endTime';
    } else {
      times[day] = '未選択';
    }
  }

  // データを次の画面に渡して遷移
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RegistrationDetailedPage(),
    ),
  );
}

Future<void> _saveDataTime(BuildContext context) async {
  // Map<String, String?> _selectedTimes = {};
  setState(() {
    for (var day in weekdays) {
      String startTime = _startTimeControllers[day]!.text;
      String endTime = _endTimeControllers[day]!.text;
      
      // 時間が入力されている場合はその時間を保存、それ以外は_selectedTimesを保存
      if (startTime.isNotEmpty && endTime.isNotEmpty) {
        // 時間が入力されている場合
        _selectedTimes[day] = '$startTime ～ $endTime';
      } else {
        // 時間が入力されていない場合、_selectedTimesの値を保存
        _selectedTimes[day] = _selectedTimes[day] ?? '未選択';
      }
      // print('$day - ${_selectedTimes[day]}');
    }
  });
}
}