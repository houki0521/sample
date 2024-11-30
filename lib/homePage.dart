import 'package:flutter/material.dart';
import 'Store_Screens.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> stores = [
    {
      'name': 'しんぱち食堂',
      'image': 'assets/images/IMG_8718.jpg',
      'description': '渋谷駅徒歩6~7分の魚料理店。朝食・モーニングあり。',
      'details': '定食なら大盛りでも\n1200円以内!!!',
    },
    // {
    //   'name': '他の店名',
    //   'image': 'assets/images/IMG_8720.jpg',
    //   'description': '東京駅近くのカフェ。リラックスできる雰囲気。',
    //   'details': '調査中',
    // },
    // {
    //   'name': 'また別の店',
    //   'image': 'assets/images/IMG_8721.jpg',
    //   'description': '渋谷で人気のイタリアンレストラン。',
    //   'details': '調査中',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'お店を検索',
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
          children: [
            const DrawerHeader(
              child: Text('メニュー'),
            ),
            ListTile(
              title: Text('レビュアーを探す'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('このアプリについて'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('ヘルプ・お問い合わせ'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('利用規約'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index]; // 各店舗データを取得
          return Card(
            child: ListTile(
              title: Text(store['name']!),
              subtitle: Column(
                children: <Widget>[
                  // 店舗の画像
                  Image.asset(
                    store['image']!,
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // 店の説明
                  Text(store['description']!),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Store_ScreensPage(
                            store: store,
                          )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
