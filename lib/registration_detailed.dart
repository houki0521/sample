import 'package:flutter/material.dart';
import 'editStoreInformation.dart';

class RegistrationDetailedPage extends StatefulWidget {
  const RegistrationDetailedPage({super.key});

  @override
  State<RegistrationDetailedPage> createState() => _RegistrationDetailedPageState();
}

class _RegistrationDetailedPageState extends State<RegistrationDetailedPage> {
  var _appointmentsText = '';
  var _transportationText = '';
  var _privateRoomText = '';
  var _supplementaryInformationText = '';
  var _dressCodeText = '';
  List<String?> _reservationOptions = ['予約可', '予約不可', '完全予約制', '未確認'];
  List<String?> _card = ['カード可', 'カード不可', '未確認'];
  List<String?> _electronicMoney = ['電子マネー可', '電子マネー不可', '未確認'];
  List<String?> _budget = ['1000円', '2000円', '3000円', '4000円'];
  List<String?> _privateRoom = ['有', '無', '未確認'];
  List<String?> _charteringOption = ['可', '不可', '未確認'];
  List<String?> _parkingLotOption = ['有', '無', '未確認'];
  List<Map<String, dynamic>> _spaceFacilitiesCheckbox = [
    {'value': 'オシャレな空間', 'checked': false},
    {'value': '落ち着いた空間', 'checked': false},
    {'value': '席が広い', 'checked': false},
    {'value': 'カップルシートあり', 'checked': false},
    {'value': 'カウンター席あり', 'checked': false},
    {'value': 'ソファー席あり', 'checked': false},
    {'value': '座席あり', 'checked': false},
    {'value': '掘りごたつあり', 'checked': false},
    {'value': 'オープンテラスあり', 'checked': false},
    {'value': 'カラオケあり', 'checked': false},
    {'value': 'ダーツあり', 'checked': false},
    {'value': 'ライブ・生演奏あり', 'checked': false},
    {'value': 'スポーツ観戦可', 'checked': false},
    {'value': 'バリアフリー', 'checked': false},
    {'value': '立ち飲みができる', 'checked': false},
    {'value': 'プロジェクターあり', 'checked': false},
    {'value': '電源あり', 'checked': false},
    {'value': '無料Wi-Fiあり', 'checked': false},
    {'value': '有料Wi-Fiあり', 'checked': false},
    {'value': '車椅子で入店可', 'checked': false},    
  ];
  List<Map<String, dynamic>> _cellularTelephoneCheckbox = [
    {'value': 'docomo', 'checked': false},
    {'value': 'au', 'checked': false},
    {'value': 'SoftBnk', 'checked': false},
    {'value': 'Y!mobile', 'checked': false},
  ];
  List<Map<String, dynamic>> _beverageCheckBox = [
    {'value': '日本酒あり', 'checked': false},
    {'value': '焼酎あり', 'checked': false},
    {'value': 'ワインあり', 'checked': false},
    {'value': 'カクテルあり', 'checked': false},
    {'value': '日本酒にこだわる', 'checked': false},
    {'value': '焼酎にこだわる', 'checked': false},
    {'value': 'ワインにこだわる', 'checked': false},
    {'value': 'カクテルにこだわる', 'checked': false},
  ];
  List<Map<String, dynamic>> _cookingCheckBox = [
    {'value': '野菜料理にこだわる', 'checked': false},
    {'value': '魚料理にこだわる', 'checked': false},
    {'value': '健康・美容メニューあり', 'checked': false},
    {'value': 'ベジタリアンメニューあり', 'checked': false},
    {'value': '英語メニューあり', 'checked': false},
    {'value': '朝食モーニングあり', 'checked': false},
    {'value': 'アレルギー表示あり', 'checked': false},
    {'value': 'カロリー表示あり', 'checked': false},
    {'value': 'デザート食べ放題あり', 'checked': false},
  ];
  List<Map<String, dynamic>> _locationCheckBox = [
    {'value': '景色がきれい', 'checked': false},
    {'value': '夜景が見える', 'checked': false},
    {'value': '海が見える', 'checked': false},
    {'value': 'ホテルのレストラン', 'checked': false},
    {'value': '隠れ家レストラン', 'checked': false},
    {'value': '一軒家レストラン', 'checked': false},
  ];
  List<Map<String, dynamic>> _serviceCheckBox = [
    {'value': '2時間半以上の宴会可', 'checked': false},
    {'value': 'お祝い・サプライズ可', 'checked': false},
    {'value': 'ドリンク持込可', 'checked': false},
    {'value': 'ソムリエがいる', 'checked': false},
    {'value': 'ペット可', 'checked': false},
    {'value': 'テイクアウトあり', 'checked': false},
    {'value': 'デリバリー', 'checked': false},
  ];
  List<Map<String, dynamic>> _childCheckbox = [
    {'value': '子供可', 'checked': false},
    {'value': 'お子様メニューあり', 'checked': false},
    {'value': 'ベビーカー入店可', 'checked': false},
  ];
  String? _selectedReservation;
  String? _selectedValue;
  String? _selectedcardItem;
  String? _selectedElectronicMoneyItem;
  String? _selectedPrivateRoomItem;
  String? _selectedcharteringOptionItem;
  String? _selectedParkingLotOptionItem;

  bool _spaceFacilitiesIsChecked = false;
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    

    return Scaffold(
      appBar: AppBar(
        title: Text('店舗登録情報編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
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
                      '予約',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '予約',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Wrap(
                spacing: 8.0, // アイテム間の水平間隔
                runSpacing: 4.0, // アイテム間の垂直間隔
                children: _reservationOptions.map((String? value) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String?>(
                        value: value,
                        groupValue: _selectedReservation,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedReservation = newValue;
                            print(_selectedReservation);
                          });
                        },
                      ),
                      Text(value ?? ''),
                    ],
                  );
                }).toList(),
              ),
              // SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '予約時の注意事項',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(height: _screenSize.height * 0.008),
              Container(
                child: TextFormField(
                  maxLines: 6,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  enabled: _appointmentsText.length <= 200,
                  decoration: InputDecoration(
                  hintText: '例   電話予約可能な時間帯[ 平日 11:00~21:00 ]\n遅れる場合はご一報ください\nキャンセル料は予約料金の20%です',
                  counterText: '${_appointmentsText.length} / 200',
                  errorText: _appointmentsText.length > 200 ? 'これ以上記入できません' : null,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // エラー時の枠線
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // フォーカス時にエラーがある場合の枠線
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _appointmentsText = value;
                      });
                    },
                  ),
              ),
              SizedBox(height: _screenSize.height * 0.050,),
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
                      '交通手段',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '交通手段',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Container(
                child: TextFormField(
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  enabled: _transportationText.length <= 1000,
                  decoration: InputDecoration(
                    counterText: '${_transportationText.length} / 1000',
                    hintText: '例   JR恵比寿駅西口から徒歩5分\n東京メトロ東西線から徒歩3分',
                    errorText: _transportationText.length > 1000 ? 'これ以上記入できません' : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.red
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.red
                        )
                      )
                    ),
                    onChanged: (value) {
                      setState(() {
                        _transportationText = value;
                      });
                    },
                  ),
              ),
              SizedBox(height: _screenSize.height * 0.050,),
              Row(
                children: [
                  Container(
                    width: 5, // 縦線の太さ
                    height: 20, // 縦線の高さ
                    color: Colors.orange,
                    padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                    child: const Text(
                      '予算・支払い方法',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '予算',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.orange,),
                    Text('昼'),
                    SizedBox(width: _screenSize.width * 0.01),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder()
                        ),
                        value: _selectedValue,
                        items: _budget.map((String? value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value!)
                            );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        }
                      ),
                    ),
                    Icon(Icons.nightlight_round, color: Colors.blue,),
                    Text('夜'),
                    SizedBox(width: _screenSize.width * 0.01),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder()
                        ),
                        value: _selectedValue,
                        items: _budget.map((String? value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value!)
                            );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        }
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '支払い方法',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Container(
                height: _screenSize.height * 0.05,
                child: ListView(
                  scrollDirection: Axis.horizontal, // 横方向にスクロール
                  children: _card.map((String? value) {
                    return Row(
                      children: [
                        Radio<String>(
                          value: value!,
                          groupValue: _selectedcardItem,
                          onChanged: (String? value){
                            setState(() {
                              _selectedcardItem = value;
                              print(_selectedcardItem);
                            });
                          }
                        ),
                        Text(value)
                      ],
                    );
                  }).toList(),
                ),
              ),
             Wrap(
              spacing: 8.0, // アイテム間の水平間隔
              runSpacing: 4.0, // アイテム間の垂直間隔
              children: _electronicMoney.map((String? value) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Radio<String?>(
                        value: value,
                        groupValue: _selectedElectronicMoneyItem,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedElectronicMoneyItem = value;
                            print(_selectedElectronicMoneyItem);
                          });
                        },
                      ),
                      Text(value ?? ''),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                    child: const Text(
                      'サービス料・チャージ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '例 サービス料10%、チャージ料なし'
                  ),
                ),
              ),
              SizedBox(height: _screenSize.height * 0.050,),
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 20,
                    color: Colors.orange,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                    child: const Text(
                      '席・設備',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Text(
                '座席',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '例 30席'
                      ),
                    ),
                  ),
                  Text('席')
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '例 カウンター10席、テーブル20席'
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Text(
                '最大可能予約人数',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Row(
                children: [
                  Container(
                    child: Text('着席時'),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '例 30'
                      ),
                    ),
                  ),
                  Text('人'),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Row(
                children: [
                  Container(
                    child: Text('立食事'),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '例 40'
                      ),
                    )
                  ),
                  Text('人')
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '個室',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: _privateRoom.map((String? value) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        Radio<String?>(
                          value: value,
                          groupValue: _selectedPrivateRoomItem,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPrivateRoomItem = value;
                              print(_selectedPrivateRoomItem);
                            });
                          },
                        ),
                        Text(value ?? ''),
                      ],
                    );
                  }).toList(),
                ),
                Container(
                  child: TextFormField(
                    maxLines: 3,
                    minLines: 3,
                    keyboardType: TextInputType.multiline,
                    enabled: _privateRoomText.length <= 150,
                    decoration: InputDecoration(
                    hintText: '例   JR恵比寿駅西口から徒歩5分\n東京メトロ東西線から徒歩3分',
                    counterText: '${_privateRoomText.length} / 150',
                    errorText: _privateRoomText.length > 150 ? 'これ以上記入できません' : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red
                          )
                        )
                      ),
                      onChanged: (value) {
                        setState(() {
                          _privateRoomText = value;
                        });
                      },
                    ),
                ),
                SizedBox(height: _screenSize.height * 0.008),
                const Text(
                  '貸切',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: _charteringOption.map((String? value) {
                    return Row(
                      children: [
                        Radio<String?>(
                          value: value,
                          groupValue: _selectedcharteringOptionItem,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedcharteringOptionItem = value;
                              print(_selectedcharteringOptionItem);
                            });
                          }
                        ),
                        Text(value!)
                      ],
                    );
                  }).toList(),
                ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '駐車場',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: _parkingLotOption.map((String? value) {
                  return Row(
                    children: [
                      Radio<String?>(
                        value: value,
                        groupValue: _selectedParkingLotOptionItem,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedParkingLotOptionItem = value;
                            print(_selectedParkingLotOptionItem);
                          });
                        }
                      ),
                      Text(value!)
                    ],
                  );
                }).toList(),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '例 10台、近所にコインバーキングあり'
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '空間・設備',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Wrap(
                spacing: 10.0, // 要素間の水平スペース
                runSpacing: 10.0, // 要素間の垂直スペース（折り返し時）
                children: _spaceFacilitiesCheckbox.map((e) {
                  return SizedBox(
                    width: 150, // 各要素の固定幅
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 子要素の幅を必要最小限にする
                      children: [
                        Checkbox(
                          value: e['checked'],
                          onChanged: (bool? checkedValue) {
                            setState(() {
                              e['checked'] = checkedValue;
                              print('${e['value']} ${e['checked']}');
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            e['value'],
                            overflow: TextOverflow.ellipsis, // 長いテキストは省略表示
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '携帯電話（つながる）',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Wrap(
                spacing: 10.0, // 要素間の水平スペース
                runSpacing: 10.0, // 要素間の垂直スペース（折り返し時）
                children: _cellularTelephoneCheckbox.map((e) {
                  return SizedBox(
                    width: _screenSize.width * 0.4, // 各要素の固定幅
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 子要素の幅を必要最小限にする
                      children: [
                        Checkbox(
                          value: e['checked'],
                          onChanged: (bool? checkedValue) {
                            setState(() {
                              e['checked'] = checkedValue;
                              print('${e['value']} ${e['checked']}');
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            e['value'],
                            overflow: TextOverflow.ellipsis, // 長いテキストは省略表示
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
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
                      'メニュー',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                'ドリンク',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
             Wrap(
                spacing: 10.0, // アイテム間の水平間隔
                runSpacing: 10.0, // アイテム間の垂直間隔
                children: _beverageCheckBox.map<Widget>((e) {
                  return SizedBox(
                    width: _screenSize.width * 0.4,
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 子要素の幅を必要最小限にする
                      children: [
                        Checkbox(
                          value: e['checked'] ?? false,
                          onChanged: (bool? checkedValue) {
                            setState(() {
                              e['checked'] = checkedValue;
                              print('${e['value']} ${e['checked']}');
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            e['value'],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '料理',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Wrap(
                spacing: 10.0, // アイテム間の水平間隔
                runSpacing: 10.0, // アイテム間の垂直間隔
                children: _cookingCheckBox.map<Widget>((e) {
                  return SizedBox(
                    width: _screenSize.width * 0.4,
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 子要素の幅を必要最小限にする
                      children: [
                        Checkbox(
                          value: e['checked'] ?? false,
                          onChanged: (bool? checkedValue) {
                            setState(() {
                              e['checked'] = checkedValue;
                              print('${e['value']} ${e['checked']}');
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            e['value'],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: _screenSize.height * 0.05),
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 20,
                    color: Colors.orange,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                    child: const Text(
                      '特徴・関連情報',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                'ロケーション',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _locationCheckBox.map((e) {
                  return SizedBox(
                    width: _screenSize.width * 0.4,
                    child: Row(
                      children: [
                        Checkbox(
                          value: e['checked'],
                          onChanged: (bool? checkedValue) {
                            setState(() {
                              e['checked'] = checkedValue;
                              print('${e['value']} ${e['checked']}');
                            });
                          }
                        ),
                        Expanded(
                          child: Text(e['value'])
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                'サービス',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _serviceCheckBox.map((e) {
                  return SizedBox(
                    width: _screenSize.width * 0.4,
                    child: Row(
                      children: [
                        Checkbox(
                          value: e['checked'],
                          onChanged: (bool? checkedValue) {
                            setState(() {
                              e['checked'] = checkedValue;
                              print('${e['value']} ${e['checked']}');
                            });
                          }
                        ),
                        Expanded(
                          child: Text(e['value'])
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                'お子様連れ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _childCheckbox.map((e) {
                  return SizedBox(
                    width: _screenSize.width * 0.4,
                    child: Row(
                      children: [
                        Checkbox(
                          value: e['checked'],
                          onChanged: (bool? checkedValue) {
                            setState(() {
                              e['checked'] = checkedValue;
                              print('${e['value']} ${e['checked']}');
                            });
                          }
                        ),
                        Expanded(
                          child: Text(e['value'])
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
              const Text(
                '補足事項',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
              Container(
                child: TextFormField(
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  enabled: _supplementaryInformationText.length <= 200,
                  decoration: InputDecoration(
                  hintText: '例   ディナータイムはお子様連れ不可',
                  counterText: '${_supplementaryInformationText.length} / 200',
                  errorText: _supplementaryInformationText.length > 200 ? 'これ以上記入できません' : null,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // エラー時の枠線
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // フォーカス時にエラーがある場合の枠線
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _supplementaryInformationText = value;
                      });
                    },
                  ),
                ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                'ドレスコード',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
              Container(
                child: TextFormField(
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  enabled: _dressCodeText.length <= 200,
                  decoration: InputDecoration(
                  hintText: '例   ディナータイムはお子様連れ不可',
                  counterText: '${_dressCodeText.length} / 200',
                  errorText: _dressCodeText.length > 200 ? 'これ以上記入できません' : null,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // エラー時の枠線
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // フォーカス時にエラーがある場合の枠線
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _dressCodeText = value;
                      });
                    },
                  ),
                ),
              Container(
                child: TextFormField(
                  maxLines: 6,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: '備考',
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: _screenSize.height * 0.008),
                Container(
                  width: _screenSize.width * 1.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditStoreInformation()),
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
              SizedBox(height: _screenSize.height * 0.03),
            ],
          ),
        ),
      ),  
    );
  }
}