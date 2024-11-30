import 'package:flutter/material.dart';
import 'lists.dart';
import 'package:flutter/material.dart';

class RegistrationDetailedPage extends StatefulWidget {
  const RegistrationDetailedPage({super.key});

  @override
  State<RegistrationDetailedPage> createState() => _RegistrationDetailedPageState();
}

class _RegistrationDetailedPageState extends State<RegistrationDetailedPage> {
  List<String?> _reservationOptions = ['予約可', '予約不可', '完全予約制', '未確認'];
  String? _selectedReservation;


  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
            // SizedBox(height: _screenSize.height * 0.008),/
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                maxLines: 6,
                minLines: 6,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                hintText: '例   電話予約可能な時間帯[ 平日 11:00~21:00 ]\n遅れる場合はご一報ください\nキャンセル料は予約料金の20%です',
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                maxLines: 3,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                hintText: '例   JR恵比寿駅西口から徒歩5分\n東京メトロ東西線から徒歩3分',
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text('昼'),
                ],
              ),
            ),
          ],
        ),
      ),  
    );
  }
}