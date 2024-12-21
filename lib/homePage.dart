import 'package:flutter/material.dart';
import 'Store_Screens.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/store_data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';

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
  List<Map<String, dynamic>> stores = [];
  


  Future<void> _getAllData() async {
  try {
    final box = Hive.box<StoreData>('storeDataBox'); // ボックスを開く
    final hiveStores = box.values.toList(); // 全データをリストで取得
    final List<Map<String, dynamic>> storeList = []; // dynamic に変更してリストを保持
    print('Store List Length: ${storeList.length}');
    if (hiveStores.isNotEmpty) {
    hiveStores.forEach((store) {
      // print('取得したデータ: ${store.toString()}');
      storeList.add({
        'storeName': store.storeName ?? '',
        'storeImage': store.storeImages ?? [],
        'prText': store.prText ?? '',
        'featureText': store.featureText ?? '',
        'commitment': store.commitment ?? '',
        'seatImages': store.seatImages ?? [],
        'seatText': store.seatText ?? '',
        'coursImages': store.coursImages ?? [],
        'coursText': store.coursText ?? '',
        'menuImages': store.menuImages ?? [],
        'menuText': store.menuText ?? '',
        'drinkImages': store.drinkImages ?? [],
        'drinkText': store.drinkText ?? '',
      });
    });
  } else {
    print('Hiveからデータが取得できませんでした');
  }
  setState(() {
      stores = storeList.isNotEmpty ? storeList : [];
    });

  } catch (e) {
    print('エラーが発生しました: ${e.toString()}');
  }
}

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 244, 220, 183),
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
          final storeImage = store['storeImage'] as List<String>;

          return Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 店舗名
                  Text(
                    store['storeName'] ?? '店舗名がありません',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8), // テキストとアイコンの間に余白を入れる
                  // ブックマークアイコン
                //   IconButton(
                //     icon: Icon(
                //       store['isBookmarked']
                //           ? Icons.bookmark
                //           : Icons.bookmark_border,
                //       color: store['isBookmarked'] ? const Color.fromARGB(255, 255, 209, 2) : Colors.grey,
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         //押した時の動作
                //         store['isBookmarked'] = !store['isBookmarked'];
                //       });
                //     },
                //   ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // 店舗の画像
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // カラム数
                        crossAxisSpacing: 8, // カラム間のスペース
                        mainAxisSpacing: 8, // 行間のスペース
                      ),
                      itemCount: storeImage.toSet().length,
                      itemBuilder: (context, index) {
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: 20,
                                    height: 90,
                                    child: Image.file(
                                      File(storeImage[index]),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          color: Colors.grey,
                                          child: Center(
                                          child: Text(
                                            '画像を読み込めませんでした',
                                            style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }
                    ),
                  const SizedBox(height: 10),
                  // 店の説明
                  Text(store['prText'] ?? ''),
                  SizedBox(height: 10),
                  //店の星評価
                  Row(
                    children: [
                      RatingBar.builder(
                        // initialRating: !store['star'],
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
                      Text(store['price'].toString()),
                      SizedBox(width: 11),
                      Icon(Icons.schedule,color: const Color.fromARGB(255, 229, 198, 57)),
                      Text(store['hours'].toString()),
                    ],
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     clearAllData();
                  //   },
                  //   child: Text('削除')
                  // )
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Store_ScreensPage(
                      store: store
                    )),
                  );
                }
              ),
            );
          },
        ),
      );
    }
    Future<void> clearAllData() async {
    final box = await Hive.openBox<StoreData>('storeDataBox'); // ボックスを開く
    await box.clear();
    print('すべてのデータを削除しました');
  }
}
