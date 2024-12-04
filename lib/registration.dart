import 'package:flutter/material.dart';
import 'lists.dart';
import 'registration_detailed.dart';

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
  final Map<String, Map<String, Map<String, List<String>>>> menuData = {
    'レストラン': {
      '和食': {
        '日本料理': [
          '日本料理'
        ],
        '寿司': [
          '寿司'
        '回転寿司'
        '立ち食い寿司'
        'いなり寿司'
        '棒寿司'
        ],
        '海鮮': [
          '海鮮'
          'ふぐ'
          'かに'
          'すっぽん'
          'あんこう'
          'かき'
        ],
        'うなぎ・あなご': [
          'うなぎ'
          'あなご'
          'どじょう'
        ],
        '天ぷら': [
          '天ぷら'
        ],
        'とんかつ・揚げ物': [
          'とんかつ'
          '牛カツ'
          '串揚げ'
          'からあげ'
          '揚げ物'
        ],
        '焼き鳥・串焼き・鶏料理': [
          '焼き鳥'
          '串焼き'
          'もつ焼き'
          '鳥料理'
          '手羽先'
        ],
        'すき焼き': [
          'すき焼き'
        ],
        'しゃぶしゃぶ': [
          'しゃぶしゃぶ'
          '豚しゃぶ'
        ],
        'そば': [
          'そば'
          '立ち食いそば'
        ],
        'うどん': [
          'うどん'
          'カレーうどん'
        ],
        '麺類': [
          '麺類'
          '焼きそば'
          '沖縄そば'
          'ほうとう'
          'ちゃんぽん'
        ],
        'お好み焼き・たこ焼き': [
          'お好み焼き'
          'もんじゃ焼き'
          'たこ焼き'
          '明石焼き'
        ],
        '丼': [
          '丼'
          '牛丼'
          '親子丼'
          '天丼'
          'かつ丼'
          '海鮮丼'
          '豚丼'
        ],
        'おでん': [
          'おでん'
        ],
        'その他': [
          '郷土料理'
          '沖縄料理'
          '牛タン'
          '麦とろ'
          '釜飯'
          'お茶漬け'
          '豆腐料理'
          'ろばた焼き'
          'きりたんぽ'
          'くじら料理'
        ],
    },
      '洋食・西洋料理': {
        '洋食': [
          '洋食'
        'ハンバーグ'
        'オムライス'
        'コロッケ'
        'スープ'
        ],
        'ステーキ・鉄板焼き': [
          'ステーキ'
          '鉄板焼き'
        ],
        'フレンチ': [
          'フレンチ'
          'ビストロ'
        ],
        'イタリアン': [
          'イタリアン'
          'パスタ'
          'ピザ'
        ],
        'スペイン料理': [
          'スペイン料理'
        ],
        'ヨーロッパ料理': [
          'ヨーロッパ料理'
          'ポルトガル料理'
          'ドイツ料理'
          'ロシア料理'
          'ギリシャ料理'
        ],
        'アメリカ料理': [
          'アメリカ料理'
          'カルフォニア料理'
          'ハワイ料理'
          'ハンバーガー'
          'ホットドッグ'
        ]
    },
      '中華料理': {
        '中華料理': [
          '中華料理'
        ],
        '四川料理': [
          '四川料理'
        ],
        '台湾料理': [
          '台湾料理'
        ],
        '飲茶・点心': [
          '飲茶・点心'
        ],
        '餃子': [
          '餃子'
        ],
        '肉まん': [
          '肉まん'
        ],
        '小籠包': [
          '小籠包'
        ],
        '中華粥': [
          '中華粥'
        ],
      },
        
      'アジア・エスニック': {
        'アジア・エスニック': [
          'アジア・エスニック'
        ],
        '韓国料理': [
          '韓国料理'
          '冷麺'
        ],
        '東南アジア料理': [
          '東南アジア料理'
          'タイ料理'
          'ベトナム料理'
          'バインミー'
          'インドネシア料理'
          'シンガポール料理'
        ],
        '南アジア料理': [
          '南アジア料理'
          'インド料理'
          'ネパール料理'
          'パキスタン料理'
          'スリランカ料理'
        ],
        '中東料理': [
          '中東料理'
          'トルコ料理'
          'ケバブ'
          'モロッコ料理'
          'ファラフェル'
        ],
        '中南米料理': [
          '中南米料理'
          'メキシコ料理'
          'タコス'
          'ブラジル料理'
          'シュラスコ'
          'ペルー料理'
        ],
        'アフリカ料理': [
          'アフリカ料理'
        ],
      },
      'カレー': {
        'カレー': [
          'カレー'
        ],
        'インドカレー': [
          'インドカレー'
        ],
        'スープカレー': [
          'スープカレー'
        ],
      },
      '焼肉・ホルモン': {
        '焼肉': [
          '焼肉'
        ],
        'ホルモン': [
          'ホルモン'
        ],
        'ジンギスカン': [
          'ジンギスカン'
        ],
      },
      '鍋': {
        '鍋': [
          '鍋'
        ],
        'もつ鍋': [
          'もつ鍋'
      
        ],
        '水炊き': [
          '水炊き'
        ],
        'ちゃんこ鍋': [
          'ちゃんこ鍋'
        ],
        '火鍋': [
          '火鍋'
        ],
        'うどんすき': [
          'うどんすき'
        ],
      },
      '居酒屋': {
        '居酒屋': [
          '居酒屋'
        ],
        'ダイニングバー': [
          'ダイニングバー'
        ],
        '立ち飲み': [
          '立ち飲み'
        ],
        'バル': [
          'バル'
          '肉バル'
        ],
        'ビアガーデン・ビアホール': [
          'ビアガーデン'
          'ビアホール'
        ],
    },
    'その他レストラン': {
      'レストラン・食堂': [
        'レストラン'
        'ファミレス'
        '食堂'
        '学生食堂'
        '社員食堂'
      ],
      '創作料理・イノベーティブ': [
        '創作料理'
        'イノベーティブ'
      ],
      'オーガニック・薬膳': [
        'オーガニック'
        '薬膳'
      ],
      '弁当・おにぎり・惣菜': [
        '弁当'
        'おにぎり'
        '惣菜・デリ'
      ],
      '肉料理': [
        '肉料理'
        '牛料理'
        '豚料理'
        '馬肉料理'
        'ジビエ料理'
      ],
      'シーフード': [
        'シーフード'
        'オイスターバー'
      ],
        'サラダ・野菜料理': [
          'サラダ'
          '野菜料理'
        ],
        'チーズ料理': [
          'チーズ料理'
        ],
        'にんにく料理': [
          'にんにく料理'
        ],
        'ビュッフェ': [
          'ビュッフェ'
        ],
        'バーベキュー': [
          'バーベキュー'
        ],
        '屋台船・クリージング': [
          '屋形船・クルージング'
        ],
    },

    },
    'ラーメン': {
      'ラーメン・つけ麺': {
        'ラーメン': [
          'ラーメン'
        ],
      'つけ麺': [
        'つけ麺'
      ],
      '油そば・まぜそば': [
        '油そば・まぜそば'
      ],
      '台湾まぜそば': [
        '台湾まぜそば'
      ],
      '担々麺': [
        '台湾まぜそば'
      ],
      '汁なし担々麺': [
        '台湾まぜそば'
      ],
      '刀削麺': [
        '刀削麺'
      ],
      },
    },
    'カフェ・パン・スイーツ': {
      'カフェ・喫茶店': {
        'カフェ・喫茶店': [
          'カフェ'
          '喫茶店'
          '甘味処'
          'フルーツパーラー'
          'パンケーキ'
          'コーヒースタンド'
          'ティースタンド'
          'ジューススタンド'
          'タピオカ'
        ],
        'スイーツ': [
          'スイーツ'
          '洋菓子'
          'ケーキ'
          'シュークリーム'
          'チョコレート'
          'ドーナツ'
          'マカロン'
          'バームクーヘン'
          'プリン'
          'クレープ・ガレット'
          '和菓子'
          '大福'
          'たい焼き・大判焼き'
          'どら焼き'
          'カステラ'
          '焼き芋・大学芋'
          'せんべい'
          '中華菓子'
          'ジェラート・アイスクリーム'
          'ソフトクリーム'
          'かき氷'
        ],
        'パン・サンドイッチ': [
          'パン'
          'サンドイッチ'
          'ベーグル'
        ],
      },
    },
    'バー・お酒': {
      'バー' :{
        'バー': [
          'バー'
        ],
        'パブ': [
          'パブ'
        ],
        'ワインバー': [
          'ワインバー'
        ],
        'ビアバー': [
          'ビアバー'
        ],
        'スポーツバー': [
          'スポーツバー'
        ],
        '日本酒バー': [
          '日本酒バー'
        ],
        '焼酎バー': [
          '焼酎バー'
        ],
      },
    },
    '料理旅館・オーベルジュ': {
      '料理旅館・オーベルジュ' : {
        '料理旅館': [
          '料理旅館'
        ],
        'オーベルジュ': [
          '料理旅館'
        ],
      }
    },
    'その他': {
      'その他' : {
        'その他': [
          'カラオケ'
          'ダーツ'
          'ホテル'
          '旅館・民宿'
          '結婚式場'
          '道の駅'
          'コンビニ・スーパー'
          '売店'
        ],
      },
    }
  };

  
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
                        SizedBox(height: _screenSize.height * 0.050,),
                        Row(
                          children: <Widget>[
                            Container(
                            width: 5,
                            height: 20,
                            color: Colors.orange,
                            ),
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
                        Container(
                          width: _screenSize.width * 1.5,
                          padding: EdgeInsets.symmetric(vertical: _screenSize.height * 0.01),
                          decoration: BoxDecoration(
                            border: Border(
                              // top: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                              // left: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                              // right: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrationDetailedPage()),
                        );
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
                          onChanged: (String? selectedValue) {
                            setState(() {
                              _selectedTimes[day] = selectedValue; // 選択を更新
                              print('選択された値: $_selectedTimes[day]');
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
                  _saveData(context);
                  Navigator.of(context).pop();
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
    // print("選択した時間: ${controller.text}"); // コンソールに出力
  }
}
Future<void> _saveData(BuildContext context) async {
  setState(() {
     for (var day in weekdays) {
        String startTime = _startTimeControllers[day]!.text;
        String endTime = _endTimeControllers[day]!.text;
    print('$day - 開始時間: $startTime - 終了時間: $endTime');
  }
  });
}
}
