import 'package:flutter/material.dart';
import 'Store_Screens.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/store_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    _getAllData(); // データを初期化時に取得
  }

  late Box box;
  List<Map<String, String>> stores = [];

  Future<void> _getAllData() async {
  try {
    final box = Hive.box<StoreData>('storeDataBox'); // ボックスを開く
    final hiveStores = box.values.toList(); // 全データをリストで取得
    final List<Map<String, String>> storeList = [];
    print('Store List Length: ${storeList.length}');
    for (var store in hiveStores) {
      storeList.add({
        'name': store?.storeName ?? '',
        'image': store?.storeImages[0] ?? '',
        'description': store?.featureText ?? '',
        'details': store?.commitment ?? '',
      });
    }

    setState(() {
        stores = storeList; // データをState変数に設定
      });

  } catch (e) {
    print('エラーが発生しました: $e');
  }
}

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
        shrinkWrap: true, // 子要素に合わせてサイズを調整
        // physics: NeverScrollableScrollPhysics(), // スクロールを無効化
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
