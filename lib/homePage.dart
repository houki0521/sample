import 'package:flutter/material.dart';
import 'Store_Screens.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/store_data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

  final List<Map<String, dynamic>> stores = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 220, 183),
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 店舗名
                  Text(
                    store['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8), // テキストとアイコンの間に余白を入れる

                  // ブックマークアイコン
                  IconButton(
                    icon: Icon(
                      store['isBookmarked']
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: store['isBookmarked'] ? const Color.fromARGB(255, 255, 209, 2) : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        //押した時の動作
                        store['isBookmarked'] = !store['isBookmarked'];
                      });
                    },
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 店舗の画像
                  Image.asset(
                    store['image'].first,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  // 店の説明
                  store['description'] == null || store['description']!.isEmpty
                  ? const SizedBox.shrink() // 高さ0の空のウィジェット
                  : Text(store['description']!),
                  SizedBox(height: 10),

                  //店の星評価
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: store['star'],
                        itemSize: 25,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 188, 2),
                        ),
                        onRatingUpdate: (rating) {
                          //評価が更新されたときの処理を書く
                        },
                        
                      ),
                      SizedBox(width: 5),
                      Text(store['star'].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.paid,color: Color.fromARGB(255, 232, 190, 1)),
                      Text(store['price']),
                      SizedBox(width: 11),
                      Icon(Icons.schedule,color: const Color.fromARGB(255, 229, 198, 57)),
                      Text(store['hours']),
                    ],
                  ),

                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Store_ScreensPage(
                      store: store,

                  )),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
  
}
