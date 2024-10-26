import 'package:flutter/material.dart';


class Store_ScreensPage extends StatefulWidget {
  const Store_ScreensPage({super.key});

  @override
  State<Store_ScreensPage> createState() => _Store_ScreensPageState();
}

class _Store_ScreensPageState extends State<Store_ScreensPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // 画面の幅を取得
    final screenHeight = MediaQuery.of(context).size.height; // 画面の高さを取得

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ロゴ(ホームに戻れる機能付き)',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
          children: [
            Image.asset('assets/images/IMG_8718.jpg'),
            Text(
              '炭火焼き定食\nしんんぱち食堂',
              style: TextStyle(
                color: Colors.white,
                ),
              ),
            ],
           ),
           Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('定食なら大盛りでも\n1200円以内!!!'),
              ],
            ),
           ),
           Container(
            padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 50),
            child: Column(
              children: [
                Text('ユーザー評価'),
                Text('運営評価'),
              ],
            ),
           ),
          ],
        ),
      )
    );
  }
}
